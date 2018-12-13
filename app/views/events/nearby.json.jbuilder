json.position do
  json.latitude @latitude
  json.longitude @longitude
  json.accuracy @accuracy
end

json.events @events, :name, :location, :distance
