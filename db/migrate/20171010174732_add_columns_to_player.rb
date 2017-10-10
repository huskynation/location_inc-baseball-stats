class AddColumnsToPlayer < ActiveRecord::Migration
  def change
  add_column :players, :doubles, :integer
  add_column :players, :triples, :integer
  add_column :players, :walks, :integer
  add_column :players, :hbp, :integer
  add_column :players, :sh, :integer
  add_column :players, :sf, :integer
  add_column :players, :obp, :float
  change_column :players, :ops, :float
  end
end
