json.gifs_by_collections do
  json.array! @gifs_by_collections do |gif|
    json.extract! gif, :id, :tags, :user_id, :image, :user_name, :user_avatar, :collection_count, :created_at
  end
end
json.gifs_by_new do
  json.array! @gifs_by_new do |gif|
    json.extract! gif, :id, :tags, :user_id, :image, :user_name, :user_avatar, :collection_count, :created_at
  end
end

