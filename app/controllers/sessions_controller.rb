class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create, :welcome, :google_login]

    def create
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            redirect_to login_path
        end
    end

    def google_login
        @user = User.from_omniauth(auth)
        session[:user_id] = @user.id
        redirect_to root_path
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end
