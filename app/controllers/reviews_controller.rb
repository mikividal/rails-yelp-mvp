class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params_reviews)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_reviews
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
