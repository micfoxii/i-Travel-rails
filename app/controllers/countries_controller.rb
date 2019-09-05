class CountriesController < ApplicationController

    def new
    end

    def index
        @countries = Country.all 
    end
end
