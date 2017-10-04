class AddBatsToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :bats, :integer
  end
end
