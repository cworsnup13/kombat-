class Player < ActiveRecord::Base
  attr_accessible :avatar, :cumulative_wins, :current_score, :email, :name, :pin, :skill, :total_games
end
