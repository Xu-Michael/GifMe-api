json.collections do
  json.array! @collections do |collection|
    json.extract! collection, :gif, :gif_collection_count, :user_name, :user_avatar
  end
end
