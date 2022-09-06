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
    @restaurant = Restaurant.find(params[:restaurant_id])
      @qrcode = RQRCode::QRCode.new("https://foodvisualizer.com/scanned/?restaurant_id=#{@restaurant.id}")
    @svg = @qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6
    )
  end

  # def qr_code_generator
  # end

  # def qr_code_download
  #   @menu = Menu.find(params[:id]) # this doesn't exist
  #   @restaurant = @menu.restaurant
  #   send_data RQRCode::QRCode.new(@restaurant.to_s).as_png(size: 300), type: 'image/png', disposition: 'attachment'
  # end

  # def visitor
  # end

  private

  def menu_params
    params.require(:menu).permit(:name, :category)
  end

end
