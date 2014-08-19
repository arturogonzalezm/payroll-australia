json.array!(@tax_ranges) do |tax_range|
  json.extract! tax_range, :id, :income_min, :income_max, :rate, :tax_from_lower_range
  json.url tax_range_url(tax_range, format: :json)
end
