class ConnectionsRestaurantsUser < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
end
