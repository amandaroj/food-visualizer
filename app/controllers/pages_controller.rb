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
    @restaurant = 41
    @menus = Menu.where(restaurant_id: @restaurant)
  end

  def scanned
    # The QR code tells you: the restaurant_id
    # @id = 15
    @restaurant = Restaurant.find(params[:restaurant_id])
    # every time you execute the next line:
    Restaurant.increment_counter(:scans_count, @restaurant.id)
    @menus = Menu.where(restaurant_id: @restaurant.id)
    # then you want to see the restaurants#show and klick the menu you want to see
    # this could be a pages#menus ()
    # then you want the menus#show page
  end

  def preview_scanned
    @restaurant = Restaurant.find(params[:restaurant_id])
    Restaurant.increment_counter(:scans_count, @restaurant.id)
    @menus = Menu.where(restaurant_id: @restaurant.id)
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

  def preview_dishes
    @menu = Menu.find(params[:menu_id])
    @dishes = Dish.where(menu: @menu)
    if params[:query].present?
      sql_query = "name ILIKE ? AND menu_id = ?"
      @dishes = Dish.where(sql_query, "%#{params[:query]}%", params[:menu_id])
    else
      @dishes = Dish.where(menu: @menu)
    end
  end

  def reviews_owner
    # ALL REVIEWS
    @all_reviews = Review.all

    # AVERAGE RATING ALL DISHES
    total = 0
    @all_reviews.size
    @all_reviews.each do |review|
      total = total + review.rating.to_i
    end
    @average_rating_all_dishes = total/@all_reviews.size

    # ALL REVIEWS PER DISH
    input = params[:query].capitalize if params[:query] != nil
    if input.present?
      @dish = Dish.where(name: input).first # problematic if one owner has the same dish on different menus and restaurants
      if @dish != nil
      @all_reviews_one_dish = Review.where(dish_id: @dish.id)
      total_one_dish = 0
      @all_reviews_one_dish.each do |review|
        total_one_dish = total_one_dish + review.rating
      end
        @average_rating_one_dish = total_one_dish / @all_reviews_one_dish.size
      end
    end

    # BEST AND WORST DISH
    @dishes = Dish.all
    @best_dish = @dishes.sort_by(&:average_rating).last
    @worst_dish = @dishes.sort_by(&:average_rating).first
  end


    def review_guest
    end

end

  # @all_reviews_this_dish = Review.where(dish_id: dish.id)
  # @all_reviews_this_dish.each do |review|
  #   total_this_dish = 0
  #   total_this_dish = total_this_dish + review.rating
  #   @average_rating_this_dish = total_this_dish / @all_reviews_this_dish.size
  # end
  #   dish.update(average_rating: @average_rating_this_dish)
  # end
