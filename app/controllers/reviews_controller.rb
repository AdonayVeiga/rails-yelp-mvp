class ReviewsController < ApplicationController
  before_action :fetch_restaurant
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(create_review_params)
    @review.restaurant = @restaurant
    if @review.save
      flash[:success] = 'Review successfully created'
      redirect_to restaurant_path(@restaurant)
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  private

  def fetch_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create_review_params
    params.require(:review).permit(:rating, :content)
  end
end
