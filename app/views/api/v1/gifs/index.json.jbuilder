json.gifs do
  json.array! @gifs do |gif|
    json.extract! gif, :id, :tags, :author, :image, :collected
  end
end
