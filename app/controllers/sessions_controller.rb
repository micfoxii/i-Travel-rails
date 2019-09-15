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
                redirect_to user_path(@user)
            else
                redirect_to '/'
            end
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
        #     @user = User.create_by_facebook_omniauth(auth)
        #     session[:user_id] = @user.id
        #     redirect_to user_path(@user)
        # end

        private

        def auth
            request.env['omniauth.auth']
        end
    

end