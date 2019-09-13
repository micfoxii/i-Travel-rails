class ApplicationController < ActionController::Base
    helper_method :current_user, :set_user, :is_logged_in?


    private 

    def is_logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user || User.find_by(id: session[:user_id]) if is_logged_in?
    end

    def set_user
        @user = current_user
    end

    def redirect_if_not_logged_in
        redirect_to login_path if !is_logged_in?
    end

end
