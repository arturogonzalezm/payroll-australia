class Employee < ActiveRecord::Base

  validates :first_name,    presence: true
  validates :last_name,     presence: true
  validates :annual_salary, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :super_rate,    presence: true, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 1.0}

  before_validation :convert_from_percent_to_decimal
  def full_name
    "#{self.last_name}, #{self.first_name}"
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Employee.create! row.to_hash
    end
  end

  private

  def convert_from_percent_to_decimal
    self.super_rate = self.super_rate.to_f/100 if percentage?
  end

  def percentage?
    (self.super_rate.to_s.include?('%')) or (self.super_rate.to_f > 1.0)
  end



end
