class Game < ApplicationRecord
    has_many :game_sessions
    belongs_to :user
end
