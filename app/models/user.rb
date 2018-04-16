class User < ApplicationRecord
  has_many :collections
  has_many :gifs
  validates :name, uniqueness: true, presence: true
end
