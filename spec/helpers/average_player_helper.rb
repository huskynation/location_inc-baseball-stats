module PlayersHelper
  def avg_player
    if player.avg == "NaN"
      "Average Not Available"
    else
      number_to_percentage(player.avg, precision: 3)
    end
  end
end