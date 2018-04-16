json.gifs do
  json.array! @gifs do |gif|
    json.extract! gif, :id, :tags, :user_id, :image, :collection_count
  end
end
