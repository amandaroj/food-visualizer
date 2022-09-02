# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Restaurant.destroy_all
User.destroy_all

r = Restaurant.create!(name: "Vegan Junkies", owner: "Felicite", location: "near campus")
u = User.create!(email: "ealhaverkort@gmail.com", password: "1234567890", first_name: "Eva", last_name: "Haverkort")

UserRestaurant.create!(user_id: u.id, restaurant: r) # or (user: u, restaurant: r)

m = Menu.create!(name: "Lunch menu", category: "lunch", restaurant_id: r.id)
Dish.create!(name: "Burrito", menu_id: m.id, description: "Tortilla with meat and tomatoes", price: 11)

a = Restaurant.create!(name: "Local Kitchen", owner: "Jesus", location: "Baixa Chiado")
b = User.create!(email: "localkitchen@gmail.com", password: "6897456891")

UserRestaurant.create!(user_id: b.id, restaurant_id: a.id) # or (user: u, restaurant: r)

z = Restaurant.create!(name: "La Follia", owner: "Felicite", location: "Lisbon")
UserRestaurant.create!(user_id: u.id, restaurant_id: z.id) # or (user: u, restaurant: r)
