class CountriesController < ApplicationController

    def new
        @country = Country.new
    end

    def create
        @country = Country.new(country_params)
        if @blog.save
            redirect_to countries_path
        else
            render :new
        end
    end

    def index
        @countries = Country.all.sorted
    end

    def show
        @country = Country.find(params[:id])
    end
end
