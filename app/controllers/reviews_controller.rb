class ReviewsController < ApplicationController
  def index
    @dish = Dish.find(params[:dish_id])
    @reviews = @dish.reviews
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:menu_id])
    @dish = Dish.find(params[:dish_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:menu_id])
    @dish = Dish.find(params[:dish_id])
    @review = Review.new(review_params)
    @review.dish = @dish
    if @review.save
      redirect_to restaurant_menu_dish_reviews_path(@restaurant, @menu, @dish)
    else
      render :new, state: :unprocessable_entities
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
