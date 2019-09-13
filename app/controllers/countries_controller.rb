class CountriesController < ApplicationController

    def new
        @country = Country.new
    end

    def create
        @country = Country.new(country_params)
        if @country.save
            redirect_to country_path
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

private

def country_params
    params.require(:country).permit(:name, :id)
end