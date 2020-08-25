class Player < ApplicationRecord
    has_many :game_sessions_players
    has_many :game_sessions, through: :game_sessions_players
end
