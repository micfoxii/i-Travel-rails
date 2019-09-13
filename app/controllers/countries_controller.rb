class CountriesController < ApplicationController
    before_action :redirect_if_not_logged_in


    def new
        @country = Country.new
    end

    def create
        @country = Country.new(country_params)
        if @country.save
            redirect_to new_user_review_path(current_user)
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
    params.require(:country).permit(:name)
end