class MenusController < ApplicationController
  before_action :authenticate_user!, except: :show

  def show
    @menu = Menu.find(params[:id])
    if params[:query].present?
      sql_query = "name ILIKE ? AND menu_id = ?" # doesn't make sense I don't have @dish.menu yet
      @dishes = Dish.where(sql_query, "%#{params[:query]}%", @menu.id) # ? is for passing secret values
    else
      @dishes = Dish.where(menu: @menu)
    end

    @dishes = @dishes.select { |dish| dish.dish_type == params[:dish_type] } if params[:dish_type].present?

    @dish_types = Dish.dish_types.keys
    
    # if params[:dish_type].present?
    #   @dishes = Dish.where(menu_id: @menu.id, dish_type: params[:dish_type])
    # else
    #   @dishes = Dish.where(menu_id: @menu.id)
    # end

    @current_user_is_owner = @menu.restaurant.users.include?(current_user)
    @preview_mode = (params[:preview] == "true")
    # check if the dish_catogeory is present in the url
    # if present we want to change dishes to where(dish_type)
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
