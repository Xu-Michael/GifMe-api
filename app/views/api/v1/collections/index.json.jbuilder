json.collections do
  json.array! @collections do |collection|
    json.extract! collection, :gif, :tag_list, :gif_collection_count, :user_name, :user_avatar
  end
end
