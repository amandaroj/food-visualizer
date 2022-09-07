class RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: :show

  def index
    @restaurants = current_user.restaurants
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    # optional: you can also acces @restaurant.menus
    @current_user_is_owner = @restaurant.users.include?(current_user)

    @menus = Menu.where({ restaurant_id: @restaurant.id }) # does not work, WHY?
    # @menus = Menu.where(restaurant_id == @restaurant.id) # does not work, WHY?
    # it will read restaurant_id as a column, so to acces column names, you always have to be a key, so whatever
    # is in your where, it's a hash (you can ommit the curly brackets)

    # @menus = Menu.where(params[:restaurant_id] == @restaurant.id) # does work, WHY?
    # same as : @menus = Menu.all
    # SELECT * FROM menus WHERE 6 == 6

    # why does restaurant_id == @restaurant.id not work but restaurant_id: works
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
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :owner, :location)
  end
end
