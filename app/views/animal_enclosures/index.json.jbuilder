json.array!(@animal_enclosures) do |animal_enclosure|
  json.extract! animal_enclosure, :id, :animal_id, :enclosure_id
  json.url animal_enclosure_url(animal_enclosure, format: :json)
end
