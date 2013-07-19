class AddDefaultValuesToPlayers < ActiveRecord::Migration
  def self.up #change 
    change_column_default(:Players, :cumulative_wins, 0)
    change_column_default(:Players, :current_score, 0)
    change_column_default(:Players, :avatar, "http://localhost:3000/assets/default_avatar.png")
    change_column_default(:Players, :total_games, 0)

  end
end
