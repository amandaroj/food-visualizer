class Restaurant < ApplicationRecord
  has_many :menus
  has_many :user_restaurants
  has_many :users, through: :user_restaurants
end
