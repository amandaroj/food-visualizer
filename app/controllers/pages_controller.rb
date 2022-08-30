class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @restaurants = current_user.restaurants
    # listen to what restaurant is clicked and define @restaurant
    @restaurant = "don't know yet"
    @menus = Menu.where(restaurant_id: @restaurant)
  end
end
