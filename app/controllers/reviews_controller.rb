class ReviewsController < ApplicationController
    before_action :set_review, only: [:new, :destroy]


  def index
    if current_user.admin_flg == true
      @reviews = Review.all.order("created_at DESC")
                     .page(params[:page]).per(10)
    else
      @hotel = Hotel.find(params[:hotel_id])
      @reviews = @hotel.reviews
      @reviews = Review.order("created_at DESC")
                     .page(params[:page]).per(10)
    end
  end
  def new
  	@review = Review.new	
  end

  def create
  	@review = Review.new(review_params)
    @review.hotel_id = params[:hotel_id]
  	@review.save 
  	redirect_to hotel_reviews_path  	
  end

  def destroy
    @review.destroy
    redirect_to reviews_path
  end

  private
    
    def set_review
        @review = Review.find(params[:id])        
    end  
    
    def review_params
      params.require(:review).permit(:profile_image, :star, :nickname, :review, :hotel_id)
    end
end
