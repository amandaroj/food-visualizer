class MenusController < ApplicationController
  def show
    @menu = Menu.find(params[:id])
    @dishes = Dish.where(menu_id: @menu.id)
  end

  def new
    @menu = Menu.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @menu = Menu.new(menu_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu.restaurant_id = params[:restaurant_id]
    @menu.save
    redirect_to restaurant_path(@restaurant)
  end

  def edit
    @menu = Menu.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def update
    @menu = Menu.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    if @menu.update(menu_params)
      redirect_to restaurant_path(@restaurant)
    else
      render 'edit', status: :unprocessable_entities
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu.destroy
    redirect_to restaurant_path(@restaurant), status: :see_other
  end

  def qr
    @menu = Menu.find(params[:id])
    @dishes = Dish.where(menu_id: @menu.id)
    RQRCode::QRCode.new("https://foodvisualiser.com/")
  end

  def visitor
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :category)
  end

end
