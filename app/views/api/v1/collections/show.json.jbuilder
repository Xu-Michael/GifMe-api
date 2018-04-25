json.extract! @collection, :id, :user_id, :gif_id, :created_at, :updated_at
json.collection_count @collection.gif.collection_count
