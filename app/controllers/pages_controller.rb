class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @restaurants = current_user.restaurants
    # listen to what restaurant is clicked and define @restaurant
    @restaurant = "don't know yet"
    @menus = Menu.where(restaurant_id: @restaurant)
  end

  def scanned
    # The QR code tells you: the restaurant_id
    @id = 15
    @restaurant = Restaurant.find(@id)
    @menus = Menu.where(restaurant_id: @id)
    # then you want to see the restaurants#show and klick the menu you want to see
    # this could be a pages#menus ()
    # then you want the menus#show page
  end

  def dishes
    # @dishes = Dish.where()
    @menu = Menu.find(params[:menu_id])
    @dishes = Dish.where(menu: @menu)
  end

end
