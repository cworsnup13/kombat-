class AddGames < ActiveRecord::Migration

  def change
    create_table :games do |t|
	t.string :player1
	t.string :player2
	t.string :score1
	t.string :score2
	t.timestamps
  end
  end
end
