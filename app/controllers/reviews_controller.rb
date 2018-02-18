class ReviewsController < ApplicationController
  PER = 5

  def index
  	@reviews = Review.all
  end


  def new
  	@review = Review.new	
  end

  def create
  	@review = Review.new(review_params)
  	@review.save 
  	redirect_to reviews_path  	
  end

  private
    def review_params
      params.require(:review).permit(:star, :nickname, :review, :hotel_id)
    end
end
