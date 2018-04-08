class Gif < ApplicationRecord
  has_many :collections
  has_many :users, through: :collections
  validates :image, uniqueness: true, presence: true
  validates :tags, presence: true
  validates :author, presence: true
end
