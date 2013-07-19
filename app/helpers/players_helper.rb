module PlayersHelper
  def get_winner(player_one, player_two)
    if player_one.current_score > player_two.current_score
      player_one.id
    elsif player_two.current_score > player_one.current_score
      player_two.id
    else -1
    end 
  end
end
