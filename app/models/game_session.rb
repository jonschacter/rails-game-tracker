class GameSession < ApplicationRecord
    belongs_to :game
    has_one :user, through: :game
    has_many :game_sessions_players
    has_many :players, through: :game_sessions_players

    def winner=(player_array)
        self.reset_winners
        player_array.each do |player|
            join_row = self.game_sessions_players.find{|obj| obj.player_id == player.id}
            join_row.update(winner?: true)
        end
    end

    def winner
        array = self.game_sessions_players.where(winner?: true)
        array.collect do |join_row|
            Player.find_by_id(join_row.player_id)
        end
    end

    def reset_winners
        self.game_sessions_players.each do |join_row|
            join_row.update(winner?: false)
        end
    end
end
