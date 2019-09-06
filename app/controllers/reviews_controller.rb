class ReviewsController < ApplicationController

    def new
        set_user
        find_city
        @review = Review.new
    end

    def create
        set_user
        find_city
        @review = @user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    private

    def find_city
        @city = City.find_by(:id params[:city_id])
    end
    
    def review_params
        params.require(:review).permit(:user_id, :title, :content, :city_id, city_attributes: [:city, :country, :country_id, :state, :state_id]) #, :state_id, state_attributes: [:name], :country_id, country_attributes: [:name])
    end
end
