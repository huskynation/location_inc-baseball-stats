class AddHitsToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :hits, :integer
  end
end
