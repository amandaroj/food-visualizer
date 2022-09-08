class Dish < ApplicationRecord
  belongs_to :menu
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  enum :dish_type, { main: 0, starter: 1, desert: 2, side: 3, drink: 4}
end
