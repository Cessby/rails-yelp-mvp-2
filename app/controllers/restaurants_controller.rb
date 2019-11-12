class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    # @restaurants = current_user.restaurants
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def new           # GET /restaurants/new
    @restaurant = Restaurant.new
  end

  def create
    # Unless @restaurant.valid?, #save will return false,
    # and @restaurant is not persisted.
    # TODO: present the form again with error messages.
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
