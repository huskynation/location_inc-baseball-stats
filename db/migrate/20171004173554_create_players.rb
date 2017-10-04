class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first
      t.string :last
      t.string :position
      t.integer :avg
      t.integer :hr
      t.integer :rbi
      t.integer :runs
      t.integer :sb
      t.integer :ops

      t.timestamps null: false
    end
  end
end
