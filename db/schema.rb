# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_07_114134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "activities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.datetime "dt"
    t.string "municipality_code"
    t.string "locality"
    t.float "alt"
    t.float "lat"
    t.float "lon"
    t.float "flight_max_height"
    t.integer "category"
    t.integer "scenary"
    t.integer "flight_type"
    t.integer "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "dt_closed"
    t.index ["dt"], name: "index_activities_on_dt"
    t.index ["dt_closed"], name: "index_activities_on_dt_closed"
  end

  create_table "equipment_types", id: :string, force: :cascade do |t|
    t.json "config"
  end

  create_table "equipments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.uuid "mission_id"
    t.index ["mission_id"], name: "index_equipments_on_mission_id"
    t.index ["name"], name: "index_equipments_on_name"
    t.index ["type"], name: "index_equipments_on_type"
  end

  create_table "missions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "activity_id"
    t.datetime "dt_start"
    t.datetime "dt_end"
    t.json "uav_setup"
    t.json "meteo_info"
    t.json "sat_info"
    t.uuid "pilot_id"
    t.index ["activity_id"], name: "index_missions_on_activity_id"
    t.index ["dt_end"], name: "index_missions_on_dt_end"
    t.index ["dt_start"], name: "index_missions_on_dt_start"
    t.index ["pilot_id"], name: "index_missions_on_pilot_id"
  end

  create_table "pilots", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "user_code"
    t.string "operator_code"
    t.string "EASA_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_pilots_on_name"
    t.index ["operator_code"], name: "index_pilots_on_operator_code"
    t.index ["user_code"], name: "index_pilots_on_user_code"
  end

  create_table "uav", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nick"
    t.string "model"
    t.string "producer"
    t.string "serial_number"
    t.string "mod_max"
    t.string "plate"
    t.json "authorized_for"
    t.index ["model"], name: "index_uav_on_model"
    t.index ["nick"], name: "index_uav_on_nick"
    t.index ["plate"], name: "index_uav_on_plate"
    t.index ["serial_number"], name: "index_uav_on_serial_number"
  end

  create_table "usages", force: :cascade do |t|
    t.uuid "mission_id"
    t.uuid "equipment_id"
    t.datetime "dt_start"
    t.datetime "dt_end"
    t.integer "seconds"
    t.index ["dt_end"], name: "index_usages_on_dt_end"
    t.index ["dt_start"], name: "index_usages_on_dt_start"
    t.index ["equipment_id"], name: "index_usages_on_equipment_id"
    t.index ["mission_id"], name: "index_usages_on_mission_id"
    t.index ["seconds"], name: "index_usages_on_seconds"
  end

end
