class User < ApplicationRecord
  has_many :collections
  has_many :gifs
  validates :name, uniqueness: true, presence: true
  has_many :collected_gifs, through: :collections, source: :user

  def user_collection_count
    Collection.where(user_id: id).count
  end
end
