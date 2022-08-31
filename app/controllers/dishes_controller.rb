class DishesController < ApplicationController
  def new
    @dish = Dish.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:menu_id])
  end

  def create
    @dish = Dish.new(dish_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:menu_id])
    @dish.menu_id = params[:menu_id]
    @dish.save
    redirect_to restaurant_menu_path(@restaurant, @menu)
  end

  def edit
    @dish = Dish.find(params[:id])
    @menu = Menu.find(params[:menu_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def update
    @dish = Dish.find(params[:id])
    @menu = Menu.find(params[:menu_id])
    @restaurant = Restaurant.find(params[:restaurant_id])

    # params = dish_params[:photos].first.empty? ? dish_params.except(:photos) : # it's a hash

    if dish_params[:photos].size < 2
      params = dish_params.except(:photos)
    else
      params = dish_params
    end

    if @dish.update(params)
      redirect_to restaurant_menu_path(@restaurant, @menu)
    else
      render 'edit', status: :unprocessable_entities
    end
  end

  def destroy
    @dish = Dish.find(params[:id])
    @menu = Menu.find(params[:menu_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish.destroy
    redirect_to restaurant_menu_path(@restaurant, @menu), status: :see_other
  end

  private
    def dish_params
      params.require(:dish).permit(:name, :description, :price, photos: [])
    end
end
