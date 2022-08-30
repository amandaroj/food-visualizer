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
    raise
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
    if @dish.update(dish_params)
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
      params.require(:dish).permit(:name, :description, :price)
    end
end
