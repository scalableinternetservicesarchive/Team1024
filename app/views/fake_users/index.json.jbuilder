json.array!(@fake_users) do |fake_user|
  json.extract! fake_user, :id
  json.url fake_user_url(fake_user, format: :json)
end
