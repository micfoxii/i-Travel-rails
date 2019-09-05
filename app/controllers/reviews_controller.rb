class ReviewsController < ApplicationController

    def new
        set_user
        find_city
        @review = Review.new
        # @review.build_state
        # @review.build_country
    end

    def create
        set_user
        find_city
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
        params.require(:review).permit(:title, :content, :city_id, city_attributes: [:name]) #, :state_id, state_attributes: [:name], :country_id, country_attributes: [:name])
    end

    def find_city
        @city = City.find_by(:id params[:city_id])
    end
end
