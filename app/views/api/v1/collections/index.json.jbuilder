json.collections do
  json.array! @collections do |collection|
    json.extract! collection, :gif, :user_name, :user_avatar
  end
end
