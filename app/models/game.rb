class Game < ApplicationRecord
    has_many :game_sessions, dependent: :delete_all
    belongs_to :user
end
