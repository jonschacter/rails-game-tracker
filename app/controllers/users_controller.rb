class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user
            session[:user_id] = @user.id
            redirect_to root_path
        else
            redirect_to signup_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
