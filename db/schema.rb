# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_04_27_193831) do
  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tolls", force: :cascade do |t|
    t.integer "origin_id", null: false
    t.integer "destination_id", null: false
    t.decimal "car_price", precision: 8, scale: 2
    t.decimal "truck_price", precision: 8, scale: 2
    t.decimal "bus_price", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_tolls_on_destination_id"
    t.index ["origin_id", "destination_id"], name: "index_tolls_on_origin_id_and_destination_id", unique: true
    t.index ["origin_id"], name: "index_tolls_on_origin_id"
  end

  add_foreign_key "tolls", "cities", column: "destination_id"
  add_foreign_key "tolls", "cities", column: "origin_id"
end
