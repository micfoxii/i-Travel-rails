class CitiesController < ApplicationController

    def new
        @city = City.new
    end
    
end
