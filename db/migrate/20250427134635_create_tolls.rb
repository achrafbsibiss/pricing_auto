# frozen_string_literal: true

class CreateTolls < ActiveRecord::Migration[8.0]
  def change
    create_table :tolls do |t|
      t.references :origin, null: false, foreign_key: { to_table: :cities }
      t.references :destination, null: false, foreign_key: { to_table: :cities }
      t.decimal :car_price, precision: 8, scale: 2
      t.decimal :truck_price, precision: 8, scale: 2
      t.decimal :bus_price, precision: 8, scale: 2

      t.timestamps
    end
    add_index :tolls, [ :origin_id, :destination_id ], unique: true
  end
end
