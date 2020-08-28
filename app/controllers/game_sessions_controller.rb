class GameSessionsController < ApplicationController
    def index
        @game_sessions = current_user.game_sessions.sort_by{ |sess| sess.date }.reverse
    end
        
    def show
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end
end
