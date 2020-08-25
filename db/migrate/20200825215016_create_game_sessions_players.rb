class CreateGameSessionsPlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :game_sessions_players do |t|
      t.integer :game_session_id
      t.integer :player_id
      t.boolean :winner?, default: false

      t.timestamps
    end
  end
end
