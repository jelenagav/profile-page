# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_13_103801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredient_lists", force: :cascade do |t|
    t.bigint "ingredient_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_ingredient_lists_on_ingredient_id"
    t.index ["item_id"], name: "index_ingredient_lists_on_item_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "cruelty"
    t.string "price"
    t.string "brand"
    t.string "picture_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type_category"
    t.string "product_category"
  end

  create_table "orders", force: :cascade do |t|
    t.string "status"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "USD", null: false
    t.bigint "package_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "payment"
    t.index ["package_id"], name: "index_orders_on_package_id"
  end

  create_table "package_items", force: :cascade do |t|
    t.bigint "package_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_package_items_on_item_id"
    t.index ["package_id"], name: "index_package_items_on_package_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "description"
    t.string "price_range"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_packages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "active_package_id"
    t.string "name"
    t.string "country"
    t.string "address"
    t.string "postcode"
    t.string "city"
    t.index ["active_package_id"], name: "index_users_on_active_package_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ingredient_lists", "ingredients"
  add_foreign_key "ingredient_lists", "items"
  add_foreign_key "orders", "packages"
  add_foreign_key "package_items", "items"
  add_foreign_key "package_items", "packages"
  add_foreign_key "packages", "users"
end
