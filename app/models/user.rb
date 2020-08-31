class User < ApplicationRecord
    has_many :games
    has_many :game_sessions, through: :games

    has_secure_password
    validates :username, uniqueness: true
    validates :username, presence: true

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.username = auth.info.email
            user.password = SecureRandom.hex
            user.save
        end
    end
end
