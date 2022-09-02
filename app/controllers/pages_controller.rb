class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
    @user = current_user
  end

  def dashboard
    @restaurants = current_user.restaurants
    # listen to what restaurant is clicked and define @restaurant
    @restaurant = 17
    @menus = Menu.where(restaurant_id: @restaurant)
  end

  def scanned
    # The QR code tells you: the restaurant_id
    # @id = 15
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menus = Menu.where(restaurant_id: @restaurant.id)
    # then you want to see the restaurants#show and klick the menu you want to see
    # this could be a pages#menus ()
    # then you want the menus#show page
  end

  def dishes
    @menu = Menu.find(params[:menu_id])

    @dishes = Dish.where(menu: @menu)

    if params[:query].present?
      sql_query = "name ILIKE ? AND menu_id = ?" # doesn't make sense I don't have @dish.menu yet
      @dishes = Dish.where(sql_query, "%#{params[:query]}%", params[:menu_id]) # ? is for passing secret values
    else
      @dishes = Dish.where(menu: @menu)
    end
  end
end
# @dishes = Dish.where(menu: @menu && "name ILIKE ?", "%#{params[:query]}%")
