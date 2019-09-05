class ReviewsController < ApplicationController

    def new
        @review = Review.new
        @review.build_city
        @review.build_state
        @review.build_country
    end

    def create
          @review = Review.new(review_params)
          @review.user_id = session[:user_id]
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    private

    def review_params
        params.require(:review).permit(:title, :content, :city_id, city_attributes: [:name], :state_id, state_attributes: [:name], :country_id, country_attributes: [:name])
    end
end
