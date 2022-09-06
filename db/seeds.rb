require "open-uri"
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
burrito = Dish.new(name: "Burrito", menu_id: m.id, description: "Tortilla with meat and tomatoes", price: 11)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462448/FoodVisualizer/burrito_dlidn8.jpg")
burrito.photos.attach(io: file, filename: "burrito.jpg", content_type: "image/jpg")
burrito.save

pizza = Dish.new(name: "Pizza", menu_id: m.id, description: "Pizza with tomato sauce and other stuff", price: 9)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462452/FoodVisualizer/mozzarella-pizza_xspplw.jpg")
pizza.photos.attach(io: file, filename: "mozzarellapizza.jpg", content_type: "image/jpg")
pizza.save

brownie = Dish.new(name: "Brownie", menu_id: m.id, description: "Chocolate brownie, very nice", price: 4)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662390720/FoodVisualizer/803vmgu9vpdffydzdffe6amj8cxj.jpg")
brownie.photos.attach(io: file, filename: "brownie.jpg", content_type: "image/jpg")
brownie.save

dm = Menu.create!(name: "Winter menu", category: "dinner", restaurant_id: r.id)
onionsoup = Dish.new(name: "Onion Soup", menu_id: dm.id, description: "Soup with onions and butter", price: 13)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462450/FoodVisualizer/onion-soup_ily3pn.jpg")
onionsoup.photos.attach(io: file, filename: "onionsoup.jpg", content_type: "image/jpg")
onionsoup.save

pizza = Dish.new(name: "Pizza", menu_id: dm.id, description: "Pizza with tomato sauce and other stuff", price: 9)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462452/FoodVisualizer/mozzarella-pizza_xspplw.jpg")
pizza.photos.attach(io: file, filename: "mozzarellapizza.jpg", content_type: "image/jpg")
pizza.save

cheesecake = Dish.new(name: "Cheesecake", menu_id: dm.id, description: "Unique type of cake", price: 5)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462449/FoodVisualizer/cheesecake_bdmlfz.jpg")
cheesecake.photos.attach(io: file, filename: "cheesecake.jpg", content_type: "image/jpg")
cheesecake.save

sm = Menu.create!(name: "Summer menu", category: "lunch", restaurant_id: r.id)

cesarsalad = Dish.new(name: "Cesar Salad", menu_id: sm.id, description: "Chopped romaine lettuce with garlicky croutons and a creamy sauce", price: 9)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462449/FoodVisualizer/ceasar-salad_ozank0.jpg")
cesarsalad.photos.attach(io: file, filename: "cesarsalad.jpg", content_type: "image/jpg")
cesarsalad.save

guacamole = Dish.new(name: "Guacamole", menu_id: sm.id, description: "Creamy, avocado-based dip", price: 7)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462450/FoodVisualizer/guacamole_w2ndhl.jpg")
guacamole.photos.attach(io: file, filename: "guacamole.jpg", content_type: "image/jpg")
guacamole.save

sangria = Dish.new(name: "Sangria", menu_id: sm.id, description: "White rum cocktail", price: 8)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462448/FoodVisualizer/sangria_jd9fid.jpg")
sangria.photos.attach(io: file, filename: "sangria.jpg", content_type: "image/jpg")
sangria.save

icecream = Dish.new(name: "Pssion Fruit Ice Cream", menu_id: sm.id, description: "Homemade passion fruit ice cream", price: 4)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462455/FoodVisualizer/passion-fruit-ice-cream_gmwn3y.jpg")
icecream.photos.attach(io: file, filename: "icecream.jpg", content_type: "image/jpg")
icecream.save

a = Restaurant.create!(name: "Local Kitchen", owner: "Jesus", location: "Baixa Chiado")
b = User.create!(email: "localkitchen@gmail.com", password: "6897456891")
UserRestaurant.create!(user_id: b.id, restaurant_id: a.id) # or (user: u, restaurant: r)

lkm = Menu.create!(name: "Lunch menu", category: "lunch", restaurant_id: a.id)
poke = Dish.new(name: "Poke", menu_id: lkm.id, description: "Diced raw fish", price: 9)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462450/FoodVisualizer/poke_yaynsj.jpg")
poke.photos.attach(io: file, filename: "poke.jpg", content_type: "image/jpg")
poke.save

fries = Dish.new(name: "Fries", menu_id: lkm.id, description: "Homemade french fries", price: 7)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462455/FoodVisualizer/fries_x7euum.jpg")
fries.photos.attach(io: file, filename: "fries.jpg", content_type: "image/jpg")
fries.save

hazelnutbrownie = Dish.new(name: "Homemade Brownie", menu_id: lkm.id, description: "Chocolat brownie with hazelnut", price: 4)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462448/FoodVisualizer/hazelnut-brownie_ypf7em.jpg")
hazelnutbrownie.photos.attach(io: file, filename: "hazelnutbrownie.jpg", content_type: "image/jpg")
hazelnutbrownie.save

z = Restaurant.create!(name: "La Follia", owner: "Felicite", location: "Lisbon")
UserRestaurant.create!(user_id: u.id, restaurant_id: z.id) # or (user: u, restaurant: r)

lfm = Menu.create!(name: "Dinner menu", category: "dinner", restaurant_id: z.id)
cesarsalad = Dish.new(name: "Cesar Salad", menu_id: lfm.id, description: "Chopped romaine lettuce with garlicky croutons and a creamy sauce", price: 9)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462449/FoodVisualizer/ceasar-salad_ozank0.jpg")
cesarsalad.photos.attach(io: file, filename: "cesarsalad.jpg", content_type: "image/jpg")
cesarsalad.save

pepperonipizza = Dish.new(name: "Pepperoni Pizza", menu_id: lfm.id, description: "Mozzarela, tomato sauce and pepperoni", price: 12)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462449/FoodVisualizer/pepperoni-pizza_zfcjqe.jpg")
pepperonipizza.photos.attach(io: file, filename: "pepperonipizza.jpg", content_type: "image/jpg")
pepperonipizza.save

mozzarellapizza = Dish.new(name: "Mozzarella Pizza", menu_id: lfm.id, description: "Mozzarela, basil and tomato sauce", price: 10)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462452/FoodVisualizer/mozzarella-pizza_xspplw.jpg")
mozzarellapizza.photos.attach(io: file, filename: "mozzarellapizza.jpg", content_type: "image/jpg")
mozzarellapizza.save

aperol = Dish.new(name: "Aperol Spritz", menu_id: lfm.id, description: "Prosecco Cocktail with orange slice", price: 13)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462448/FoodVisualizer/aperol_gkmtma.jpg")
aperol.photos.attach(io: file, filename: "aperol.jpg", content_type: "image/jpg")
aperol.save

vn = Restaurant.create!(name: "Vietnamese Cuisine", owner: "Kate", location: "Santo Antonio")
us = User.create!(email: "vietnamisecuisine@gmail.com", password: "0987654321", first_name: "Will", last_name: "Nam")
UserRestaurant.create!(user_id: us.id, restaurant_id: vn.id)

vlm = Menu.create!(name: "Lunch menu", category: "lunch", restaurant_id: vn.id)
bobun = Dish.new(name: "Bò Bún", menu_id: vlm.id, description: "Rice vermicelli with stir-fried beef and spring rolls", price: 11)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462455/FoodVisualizer/loes-klinker-gPzixog6XLg-unsplash_hx379c.jpg")
bobun.photos.attach(io: file, filename: "bobun.jpg", content_type: "image/jpg")
bobun.save

bahnmi = Dish.new(name: "Bahn Mi ", menu_id: vlm.id, description: "Baguette with grilled pork", price: 6)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462448/FoodVisualizer/bahn-mi_egra0v.jpg")
bahnmi.photos.attach(io: file, filename: "bahnmi.jpg", content_type: "image/jpg")
bahnmi.save

pho = Dish.new(name: "Pho", menu_id: vlm.id, description: "Chicken rice noodle special soup", price: 8)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462454/FoodVisualizer/pho_bhwcvw.jpg")
pho.photos.attach(io: file, filename: "pho.jpg", content_type: "image/jpg")
pho.save

buncha = Dish.new(name: "Bún Chà", menu_id: vlm.id, description: "Rice vermicelli with grilled pork and meatball", price: 10)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462448/FoodVisualizer/bun-cha_bzkf3j.jpg")
buncha.photos.attach(io: file, filename: "buncha.jpg", content_type: "image/jpg")
buncha.save
