class CreateGameSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :game_sessions do |t|
      t.integer :game_id
      t.string :date

      t.timestamps
    end
  end
end
