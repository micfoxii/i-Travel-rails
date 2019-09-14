class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        # set_user
        if find_city
            @review = @city.reviews.build
        else
            @review = Review.new
        end
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to user_reviews_path(current_user)
        else
            render :new
        end
    end

    def show
        find_user
        find_review
    end

    def index
        # find_user
        # @reviews = @user.reviews.all 
        if @city = City.find_by_id(params[:city_id])
            @reviews = @city.reviews
        else
            @reviews = Review.all
        end
    end

    def edit
        set_user
        find_review
    end

    def update
        set_user
        find_city
        find_review
        if @review.update(review_params)
            redirect_to user_reviews_path(@user)
        else
            render :edit
        end
    end

    def destroy
        set_user
        find_city
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

    def find_country
        @country = Country.find_by(id: params[:country_id])
    end

    def find_review
        @review = Review.find(params[:id])
    end
    
    def review_params
        params.require(:review).permit(:user_id, :rating, :title, :content, :city_id, city_attributes:[:name, :country_id], country_attributes:[:name]) #TO DO ADD STATE, :state, :state_id OR state_attributes: [:name], :country_id, country_attributes: [:name])
    end
end
