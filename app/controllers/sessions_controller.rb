class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create, :welcome, :google_login]

    def create
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to '/'
        else
            redirect_to '/login'
        end
    end

    def google_login
        @user = User.from_omniauth(auth)
        session[:user_id] = @user.id
        redirect_to '/'
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end
