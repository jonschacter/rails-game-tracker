class GamesController < ApplicationController
    def index
        @games = current_user.games
        @boardgames = []
        @videogames = []
        @cardgames = []
        @dicegames = []
        @othergames = []
        @games.each do |game|
            case game.gametype
            when "Board"
                @boardgames << game
            when "Video"
                @videogames << game
            when "Card"
                @cardgames << game
            when "Dice"
                @dicegames << game
            else
                @othergames << game
            end
        end
    end

    def show
        @game = Game.find_by(id: params[:id])
        if matching_user?(@game)
            
        else
            redirect_to games_path
        end
    end

    def new
        @game = Game.new
    end

    def create
        game = Game.new(game_params)
        game.user = current_user
        game.save
        redirect_to game_path(game)
    end

    def edit
    end

    def update
    end

    def destroy
        game = Game.find_by(id: params[:id])
        game.delete
        redirect_to games_path
    end

    private

    def game_params
        params.require(:game).permit(:name, :gametype)
    end
end