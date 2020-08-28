class GameSessionsController < ApplicationController
    def index
        @game_sessions = current_user.game_sessions.sort_by{ |sess| sess.date }.reverse
    end
        
    def show
        @game_session = GameSession.find_by(id: params[:id])
        @game = Game.find_by(id: params[:game_id])
        if @game_session.user != current_user || @game_session.game != @game
            redirect_to game_sessions_path
        end
    end

    def new
        @game_session = GameSession.new
        @games = current_user.games
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
