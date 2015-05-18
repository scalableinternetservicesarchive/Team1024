json.array!(@event_pictures) do |event_picture|
  json.extract! event_picture, :id, :event_id, :image
  json.url event_picture_url(event_picture, format: :json)
end
