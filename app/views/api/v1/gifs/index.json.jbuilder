json.top_ten_tags do
  json.array! @top_ten_tags do |tag|
    json.extract! tag, :id, :name, :taggings_count
  end
end
json.gifs do
  json.array! @gifs do |gif|
    json.extract! gif, :id, :tags, :user_id, :image, :user_name, :user_avatar, :collection_count, :created_at, :tag_list
    json.collected gif.collectors.find_by_id(@user_id).present? if @user_id
  end
end
json.gifs_by_collections do
  json.array! @gifs_by_collections do |gif|
    json.extract! gif, :id, :tags, :user_id, :image, :user_name, :user_avatar, :collection_count, :created_at, :tag_list
    json.collected gif.collectors.find_by_id(@user_id).present? if @user_id
  end
end
json.gifs_by_new do
  json.array! @gifs_by_new do |gif|
    json.extract! gif, :id, :tags, :user_id, :image, :user_name, :user_avatar, :collection_count, :created_at, :tag_list
    json.collected gif.collectors.find_by_id(@user_id).present? if @user_id
  end
end

