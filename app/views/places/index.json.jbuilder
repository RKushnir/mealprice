json.array!(@places) do |place|
  json.extract! place, :title
  json.url place_url(place, format: :json)
end
