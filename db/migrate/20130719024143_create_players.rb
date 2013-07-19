class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :skill
      t.string :email
      t.string :avatar
      t.integer :pin
      t.integer :cumulative_wins
      t.integer :total_games
      t.integer :current_score

      t.timestamps
    end
    add_index :players, :skill
  end
end
