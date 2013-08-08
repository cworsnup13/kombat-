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
end
end
class CreateGames < ActiveRecord::Migration
  def change
  create_table :games do |t|
    t.string   :player1
    t.string   :player2
	 t.integer  :scoreOf1
    t.integer  :scoreOf2
    t.timestamps

  end
  end
end
