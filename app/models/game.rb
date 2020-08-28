class Game < ApplicationRecord
    has_many :game_sessions, dependent: :delete_all
    belongs_to :user

    def my_winrate
        game_sessions = GameSession.where(game_id: self.id)
        if game_sessions.empty?
            "N/A"
        else
            my_wins = []
            game_sessions.each do |sess|
                if sess.winner.include?(Player.find_by(name: "Current User"))
                    my_wins << sess
                end
            end
            percent = (my_wins.length.to_f / game_sessions.length.to_f * 100).round(2)
        end
    end
end
