class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

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
      Dish.update(@dish.id, average_rating: ((@dish.average_rating + @review.rating)/Review.where(dish: @dish).size))
      @review.concerned_users.each do |user|
        ReviewChannel.broadcast_to(
          user,
          render_to_string(partial: "review", locals: { review: @review }) # this review is the one that is just saved
        )
        # next means: move to the next iteration if @review.rating > 3, so it only goes to what is below
        # if the ratings is smaller than 3. return would stop running the iteration.

        # Skip AlertChannel if rating is greater than 3
        next if @review.rating > 3

        AlertChannel.broadcast_to(
          user,
          render_to_string(partial: "bad_review", locals: { review: @review })
        )
      end
      redirect_to restaurant_menu_path(@menu.restaurant, @menu.id)
    else
      render :new, state: :unprocessable_entities
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
