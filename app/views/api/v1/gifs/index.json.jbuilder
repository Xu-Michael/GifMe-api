json.gifs do
  json.array! @gifs do |gif|
    json.extract! gif, :id, :tags, :user_id, :image, :collected
  end
end
