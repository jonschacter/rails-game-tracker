class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create, :welcome]

    def create
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to '/'
        else
            redirect_to '/login'
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/'
    end
end
