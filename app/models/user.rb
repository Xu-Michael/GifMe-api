class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :collections
  has_many :gifs, through: :collections
  validates :name, uniqueness: true, presence: true
end
