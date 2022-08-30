class RestaurantsController < ApplicationController
  def index
    @restaurants = current_user.restaurants
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menus = Menu.where(restaurant_id == @restaurant.id) # why does this not work?
  end


  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    ActiveRecord::Base.transaction do # this will make sure that they only get saved if both are correct and able to be saved, so you prevent restaurants with no connections
      @restaurant.save
      UserRestaurant.create(restaurant: @restaurant, user: current_user)
    end
    redirect_to restaurants_path
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path
    else
      render 'edit', status: :unprocessable_entities
    end
    redirect_to restaurants_path
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destory
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :owner, :location)
  end
end
