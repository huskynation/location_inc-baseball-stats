class Player < ActiveRecord::Base
  
  before_create :calc_batting_avg
  before_create :calc_obp
  before_create :calc_ops
  
  after_initialize :set_default_values, unless: :valid?
  validates :first, :last, :position, :avg, :hr, :rbi, :runs, :sb, :ops, :hits, :bats, presence: true
  
  
  # Formula = (hits % # at_bats)
  def calc_batting_avg
    avg = hits.to_f/bats.to_f
    self.avg = avg
  end

  # Calculates Players Singles
  def singles
    singles = hits - (doubles + triples + hr)
  end
  
  # Calculates Player's sluggin percentage
  # singles = (hits - (doubles+triples+homeruns)
  # total_bases = (singles + (2*doubles + 3*triples + 4*homeruns))
  def calc_slg
    # slugging_percentage = total_bases % at_bats
    singles = hits - (doubles + triples + hr)
    slg = (singles + (2*doubles + 3*triples + 4*hr))
  end
  

# Formula = (hits % # at_bats)
  def calc_obp
  obp = (hits.to_f + walks.to_f + hbp.to_f) / (bats.to_f + walks.to_f + hbp.to_f)
    self.obp = obp
  end
  
  def calc_ops
    ops = calc_obp + calc_slg
    self.ops = ops
  end
  


  
private
  def set_default_values
    self.avg ||= 0
    self.hr ||= 0
    self.rbi ||= 0
    self.runs ||= 0
    self.sb ||= 0
    self.ops ||= 0
    self.hits ||= 0
    self.bats ||= 0
    self.doubles ||= 0
    self.triples ||= 0
    self.walks ||= 0
    self.hbp ||= 0
    self.sh ||= 0
    self.sf ||= 0
    self.obp ||= 0
  end
end
