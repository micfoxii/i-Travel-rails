class StatesController < ApplicationController

    def new
    end

    def index
        @states = State.all
    end

end
