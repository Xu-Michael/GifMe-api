class User < ApplicationRecord
  has_many :collections
  has_many :gifs, through: :collections
  validates :name, uniqueness: true, presence: true
end
