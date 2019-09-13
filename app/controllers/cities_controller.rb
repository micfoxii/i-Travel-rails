class CitiesController < ApplicationController

    def new
        @city = City.new
        @city.build_country
    end

    def create
        @city = City.create(city_params)
        if @city.save
            redirect_to cities_path
        else
            render :new
        end
    end

    def index
        # @cities = City.search(params[:query], @city)
        @cities = City.search(params[:query]).order(:country_id) # TODO CURRENTLY ORDER BY COUNTRY ID, WANT TO SORT BY COUNTRY THEN CITY
    end

    def show
        @city = City.find(params[:id])
    end

    private

    def city_params
        params.require(:city).permit(:name, :country_id, country_attributes:[:id, :name]) #, :state_id, state_name:[:state]
    end
    
end
