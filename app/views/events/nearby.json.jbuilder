json.position do
  json.latitude @latitude
  json.longitude @longitude
  json.accuracy @accuracy
end

json.events @events do |event|
  json.id event.id
  json.creator event.creator.photo
  json.name event.name
  json.location event.location
  json.distance event.distance
end
