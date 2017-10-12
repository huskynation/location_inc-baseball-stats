class ChangeAvgToFloat < ActiveRecord::Migration
  def change
    change_column :players, :avg, :float
  end
end
