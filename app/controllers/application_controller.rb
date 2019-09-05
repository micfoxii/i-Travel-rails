class ApplicationController < ActionController::Base
    helper_method :current_user, :set_user


    def current_user
        @current_user || User.find_by(id: seesion[:user_id]) if session[:user_id]
    end

    def set_user
        @user = current_user
    end
    
end
