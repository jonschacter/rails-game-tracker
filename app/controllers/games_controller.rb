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
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def game_params
    end
end