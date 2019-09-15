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
        if params[:provider] == 'facebook'
            @user = User.find_or_create_by_omniauth(auth)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else

            @user = User.find_by(email: params[:user][:email])

            if @user.try(:authenticate, params[:user][:password])
                session[:user_id] = @user.id 
                redirect_to user_path(@user)
            else
                #TODO Flash Error
                redirect_to login_path
            end
        end
    end

        # def omniauth 
        #     @user = User.create_by_google_omniauth(auth)
        #     session[:user_id] = @user.id
        #     redirect_to user_path(@user)
        # end

        private

        def auth
            requet.env['omniauth.auth']
        end
    

end