class Gif < ApplicationRecord
  has_many :collections
  belongs_to :user
  validates :image, uniqueness: true, presence: true
  validates :tags, presence: true

  def collection_count
    Collection.where(gif_id: id).count
  end

  def user_name
    user.name
  end

  def user_avatar
    user.avatar
  end
end
