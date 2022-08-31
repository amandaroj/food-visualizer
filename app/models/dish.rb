class Dish < ApplicationRecord
  belongs_to :menu

  has_many_attached :photos
end
