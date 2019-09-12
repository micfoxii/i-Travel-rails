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
        set_user
        find_review
        if @review.update(review_params)
            redirect_to user_reviews_path(@user)
        else
            render :edit
        end
    end

    def destroy
        set_user
        find_review
        @review.destroy
        redirect_to user_reviews_path(@user)
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
        params.require(:review).permit(:user_id, :rating, :title, :content, :city_id, cities_attributes:[:name, :country_id]) #TO DO ADD STATE, :state, :state_id OR state_attributes: [:name], :country_id, country_attributes: [:name])
    end
end
