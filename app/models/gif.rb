class Gif < ApplicationRecord
  has_many :collections
  belongs_to :user
  validates :image, uniqueness: true, presence: true
  validates :tags, presence: true
end
