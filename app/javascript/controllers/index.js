// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"
// import { rating } from "./rating"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import ShowMenusOfRestaurantController from "./show_menus_of_restaurant_controller"
application.register("show-menus-of-restaurant", ShowMenusOfRestaurantController)
