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
        # find or create game
        if params[:game_session][:game] == "New"
            game = Game.new(name: params[:new_game_name], gametype: params[:new_game_type])
            game.user = current_user
            game.save
        else
            game = Game.find_by(name: params[:game_session][:game], user_id: current_user.id)
        end
        # find or create players
        players = []
        params[:game_session][:players].each do |player|
            if player == "Me"
                players << Player.find_or_create_by(name: "Current User")
            elsif player != ""
                players << Player.find_or_create_by(name: player)
            end
        end
        # add winners
        winners = []
        if params[:game_session][:winners]
            params[:game_session][:winners].each do |winner_num|
                winners << players[winner_num.to_i - 1]
            end
        end
        # create game session
        game_session = GameSession.new(date: params[:game_session][:date])
        game_session.game = game
        game_session.players = players
        game_session.save
        game_session.winner = winners

        redirect_to game_game_session_path(game, game_session)
    end

    def edit
        @game_session = GameSession.find_by(id: params[:id])
        @game = Game.find_by(id: params[:game_id])
        @games = current_user.games
        @players = @game_session.players
        if @game_session.user != current_user || @game_session.game != @game
            redirect_to game_sessions_path
        end
    end

    def update
    end

    def destroy
        game_session = GameSession.find_by(id: params[:id])
        game_session.delete

        redirect_to game_sessions_path
    end
end
