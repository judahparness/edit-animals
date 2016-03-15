json.array!(@enclosures) do |enclosure|
  json.extract! enclosure, :id, :number, :type
  json.url enclosure_url(enclosure, format: :json)
end
