class CountriesController < ApplicationController

    def new
    end

    def index
        @countries = Country.all 
    end

    def show
        @country = Country.find(params[:id])
    end
end
