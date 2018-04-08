class Collection < ApplicationRecord
  belongs_to :user
  belongs_to :gif
  validates_uniqueness_of :gif_id, :scope => [ :user_id ]
end
