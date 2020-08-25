class GameSession < ApplicationRecord
    belongs_to :game
    has_one :user, through: :game
    has_many :game_sessions_players
    has_many :players, through: :game_sessions_players
end
