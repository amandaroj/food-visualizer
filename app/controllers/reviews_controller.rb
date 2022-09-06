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
    respond_to do |format|
      if @review.save
        Dish.update(@dish.id, :average_rating => ((@dish.average_rating + @review.rating)/Review.where(dish: @dish).size))

        @review.concerned_users.each do |user|
          # if @review.rating > 3
            ReviewChannel.broadcast_to(
              user,
              render_to_string(partial: "review", locals: {review: @review}) # this review is the one that is just saved
            )
          # else
          #   # ReviewChannel.broadcast_to(
          #   #   user,
          #   #   render_to_string(partial: "review", locals: {review: @review}) # this review is the one that is just saved
          #   # )
          if @review.rating < 3
            AlertChannel.broadcast_to(
                user,
                render_to_string(partial: "bad_review", locals: {review: @review})
              )
          end
          #   # this one does not broadcast
          # end
        end
        redirect_to dishes_path(@menu.id)
      else
        render :new, state: :unprocessable_entities
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
