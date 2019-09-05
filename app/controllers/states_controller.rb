class StatesController < ApplicationController

    def new
        @state = State.new
    end
end
