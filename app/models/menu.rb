class Menu < ApplicationRecord
  belongs_to :restaurant
  has_many :dishes, dependent: :destroy
end
