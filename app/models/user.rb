class User < ApplicationRecord
    has_many :games
    has_many :game_sessions, through: :games

    has_secure_password
    validates :username, uniqueness: true
end
