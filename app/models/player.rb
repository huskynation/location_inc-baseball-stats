class Player < ActiveRecord::Base
  before_create :calc_batting_avg

  
  def singles
    singles = hits - (doubles + triples + hr)
  end

  
private
# Calculates Player's batting average
# Formula = (hits % # at_bats)
  def calc_batting_avg
    avg = hits.to_f/bats.to_f
    self.avg = avg
  end

# Calculates Player's sluggin percentage
# singles = (hits - (doubles+triples+homeruns)
# total_bases = (singles + (2*doubles + 3*triples + 4*homeruns))
# slugging_percentage = total_bases % at_bats

  def calc_batting_ops
  end
end
