class CountriesController < ApplicationController

    def new
        @country = Country.new
    end
end
