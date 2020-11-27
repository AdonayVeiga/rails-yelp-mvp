class RestaurantsController < ApplicationController
  before_action :fetch_restaurant, only: %i[edit update show destory]
  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(create_restaurant_params)
    if @restaurant.save
      flash[:success] = 'Restaurant successfully created'
      redirect_to @restaurant
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  private

  def fetch_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def create_restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
