class TaxRange < ActiveRecord::Base
  #methods
  def self.valid_tax_range(annual_salary)
    if annual_salary > 0
      TaxRange.where('income_min <= ? AND ? <= income_max', annual_salary, annual_salary).first
    else
      nil
    end
  end

  def self.annual_tax(annual_salary)
    if annual_salary > 0
    vtr = self.valid_tax_range(annual_salary)
    (vtr.tax_from_lower_range + ((annual_salary - (vtr.income_min-1))*vtr.rate)).round(3)
    else
      nil
    end
  end
end