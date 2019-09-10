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
            redirect_to user_reviews_path(@user)
        else
            render :new
        end
    end

    def show
        find_user
        find_review
    end

    def index
        find_user
        @reviews = @user.reviews.all 
    end

    def edit
        set_user
        find_review
    end

    def update
    end

    def destroy
    end

    private

    def find_user
        @user = User.find_by(id: params[:user_id])
    end

    def find_city
        @city = City.find_by(id: params[:city_id])
    end

    def find_review
        @review = Review.find(params[:id])
    end
    
    def review_params
        params.require(:review).permit(:user_id, :rating, :title, :content, :city_id, city_attributes:[:city, :country, :country_id]) #TO DO ADD STATE, :state, :state_id OR state_attributes: [:name], :country_id, country_attributes: [:name])
    end
end
