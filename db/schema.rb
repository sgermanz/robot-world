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

ActiveRecord::Schema.define(version: 2020_04_08_032039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_models", force: :cascade do |t|
    t.string "name"
    t.decimal "cost"
    t.decimal "price"
    t.integer "minStock"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cars", force: :cascade do |t|
    t.integer "year"
    t.bigint "computer_id", null: false
    t.boolean "completed"
    t.string "assembly_stage"
    t.bigint "car_model_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_model_id"], name: "index_cars_on_car_model_id"
    t.index ["computer_id"], name: "index_cars_on_computer_id"
  end

  create_table "computers", force: :cascade do |t|
    t.jsonb "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "car_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_orders_on_car_id"
  end

  create_table "stores", force: :cascade do |t|
    t.bigint "car_model_id", null: false
    t.integer "stock"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_model_id"], name: "index_stores_on_car_model_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.bigint "car_model_id", null: false
    t.integer "stock"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_model_id"], name: "index_warehouses_on_car_model_id"
  end

  add_foreign_key "cars", "car_models"
  add_foreign_key "cars", "computers"
  add_foreign_key "orders", "cars"
  add_foreign_key "stores", "car_models"
  add_foreign_key "warehouses", "car_models"
end
