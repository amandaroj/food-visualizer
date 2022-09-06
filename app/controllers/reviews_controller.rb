class ReviewsController < ApplicationController
  # def index
  #   @dish = Dish.find(params[:dish_id])
  #   @reviews = @dish.reviews
  # end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:menu_id])
    @dish = Dish.find(params[:dish_id])
    @review = Review.new
  end

  def create
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:menu_id])
    @dish = Dish.find(params[:dish_id])
    @review = Review.new(review_params)
    @review.dish_id = @dish.id
    if @review.save
      Dish.update(@dish.id, average_rating: ((@dish.average_rating + @review.rating) / Review.where(dish: @dish).size))
      reviews = Review.where(dish: @dish)
      Dish.update(@dish.id, average_rating: reviews.sum(:rating) / reviews.count.to_f)
      redirect_to dishes_path(@menu.id)
    else
      render :new, state: :unprocessable_entities
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
