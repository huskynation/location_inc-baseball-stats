class ChangeAvgToFloat < ActiveRecord::Migration
  def change
    change_column :players, :avg, :decimal, precision: 3, scale: 2
  end
end
