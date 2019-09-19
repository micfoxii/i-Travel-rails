class SessionsController < ApplicationController

    def welcome
    end

    def new
    end

    def destroy
        session.clear
        redirect_to '/'
    end

    def create
        if auth #params[:provider] == 'facebook'
            @user = User.find_or_create_by_facebook_omniauth(auth)
            if @user.id
                session[:user_id] = @user.id
                flash[:success] = "You have successfully logged in to iTravel!"
                redirect_to user_path(@user)
            else
                flash[:error] = display_errors(@user)
                redirect_to '/'
            end
        else
            @user = User.find_by(email: params[:user][:email])

            if @user.try(:authenticate, params[:user][:password])
                session[:user_id] = @user.id 
                flash[:success] = "Welcome to You have successfully logged in to iTravel!"
                redirect_to user_path(@user)
            else
                flash[:error] = "Incorrect Login"
                redirect_to login_path
            end
        end
    end

        private

        def auth
            request.env['omniauth.auth']
        end
    

end