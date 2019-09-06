class CitiesController < ApplicationController

    def new
        @city = City.new
    end

    def create
        @city = City.create(city)
    end

    def index
        @citi_paramses = City.all
    end

    private

    def city_params
        params.require(:city).permit(:name, :country_id, country_name:[:country], :state_id, state_name:[:state])
    end
    
end
