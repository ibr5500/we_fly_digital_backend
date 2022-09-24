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

ActiveRecord::Schema[7.0].define(version: 2022_09_24_131231) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airlines", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.integer "num_of_seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "airlines_airports", id: false, force: :cascade do |t|
    t.bigint "airline_id", null: false
    t.bigint "airport_id", null: false
    t.index ["airline_id", "airport_id"], name: "index_airlines_airports_on_airline_id_and_airport_id"
    t.index ["airport_id", "airline_id"], name: "index_airlines_airports_on_airport_id_and_airline_id"
  end

  create_table "airports", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "num_of_seats"
    t.string "category"
    t.bigint "users_id", null: false
    t.bigint "airports_id", null: false
    t.bigint "airlines_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airlines_id"], name: "index_reservations_on_airlines_id"
    t.index ["airports_id"], name: "index_reservations_on_airports_id"
    t.index ["users_id"], name: "index_reservations_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "fullname"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "reservations", "airlines", column: "airlines_id"
  add_foreign_key "reservations", "airports", column: "airports_id"
  add_foreign_key "reservations", "users", column: "users_id"
end
