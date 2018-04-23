json.extract! @user, :name, :avatar, :user_collection_count
json.users_gifs do
  json.array! @users_gifs do |gif|
    json.extract! gif, :id, :tags, :user_id, :image, :user_name, :user_avatar, :collection_count, :created_at, :tag_list
  end
end
