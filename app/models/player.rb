# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  first      :string
#  last       :string
#  position   :string
#  avg        :float
#  hr         :integer
#  rbi        :integer
#  runs       :integer
#  sb         :integer
#  ops        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  hits       :integer
#  bats       :integer
#

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
    obp = (hits.to_f + walks.to_f + hbp.to_f) / (bats.to_f + walks.to_f + hbp.to_f+ sf.to_f)
    self.obp = obp
  end
  
  def calc_ops
    n = hits + walks + hbp
    ops = (n/calc_obp + calc_slg) / 1000
    self.ops = ops
  end
  
  def check_nan
    if avg == "nan"
      "Average Not Available"
    end
  end
  
  def check_nan
    if ops == "nan"
      "OPS Not Available"
    end
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
