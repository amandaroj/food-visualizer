# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

r = Restaurant.create(name: "Vegan Junkies", owner: "Felicite", location: "near campus")
u = User.create(email: "ealhaverkort@gmail.com", password: "1234567890")
UserRestaurant.create(user_id: u.id, restaurant_id: r.id) #or (user: u, restaurant: r)
m = Menu.create(name: "Lunch menu", category: "lunch", restaurant_id: r.id)

