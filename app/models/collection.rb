class Collection < ApplicationRecord
  belongs_to :user
  belongs_to :gif
  validates_uniqueness_of :gif_id, :scope => [ :user_id ]

  def user_name
    user.name
  end

  def user_avatar
    user.avatar
  end

  def gif_collection_count
    Collection.where(gif_id: gif.id).count
  end
end
