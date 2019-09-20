class CitiesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @city = City.new
        @city.build_country
    end

    def create
        @city = City.new(city_params)
        if @city.save
            flash[:success] = "City Successfully Created!"
            redirect_to new_user_review_path(current_user)
        else
            @city.build_country
            flash[:errors] = @city.errors.full_messages
            render :new
        end
    end

    def index
        @cities = City.search(params[:query]).order(:name) # TODO CURRENTLY ORDER BY COUNTRY ID, WANT TO SORT BY COUNTRY THEN CITY
    end

    def show
        @city = City.find(params[:id])
    end

    def destroy
        @city = City.find(params[:id])
        @city.destroy
        redirect_to country_path
    end

    private

    def city_params
        params.require(:city).permit(:name, :country_id, country_attributes:[:name])
    end
    
    def find_country
        @country = Country.find_by(id: params[:country_id])
    end
end
