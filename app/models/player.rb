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
  after_initialize :set_default_values, unless: :valid?
  validates :first, :last, :position, :avg, :hr, :rbi, :runs, :sb, :ops, :hits, :bats, presence: true
  
  
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
  
  def set_default_values
    self.avg ||= 0
    self.hr ||= 0
    self.rbi ||= 0
    self.runs ||= 0
    self.sb ||= 0
    self.ops ||= 0
    self.hits ||= 0
    self.bats ||= 0
  end
end
