json.array!(@species) do |species|
  json.extract! species, :id, :latin_name, :canonical_name
  json.url species_url(species, format: :json)
end
