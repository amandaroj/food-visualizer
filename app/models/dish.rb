class Dish < ApplicationRecord
  belongs_to :menu
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
end
