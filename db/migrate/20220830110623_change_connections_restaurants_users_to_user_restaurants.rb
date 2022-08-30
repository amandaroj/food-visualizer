class ChangeConnectionsRestaurantsUsersToUserRestaurants < ActiveRecord::Migration[7.0]
  def change
    rename_table :connections_restaurants_users, :user_restaurants
  end
end
