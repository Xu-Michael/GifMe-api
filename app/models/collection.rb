class Collection < ApplicationRecord
  belongs_to :user
  belongs_to :gif
  validates_uniqueness_of :gif_id, :scope => [ :user_id ]

  def user_name
    gif.user_name
  end

  def user_avatar
    gif.user_avatar
  end

  def gif_collection_count
    Collection.where(gif_id: gif.id).count
  end

  def tag_list
    gif.tag_list
  end
end
