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

ActiveRecord::Schema.define(version: 2020_09_22_114010) do

  create_table "animals", force: :cascade do |t|
    t.integer "bleed_id", null: false
    t.integer "supply_user_id", null: false
    t.string "name", null: false
    t.integer "sex", null: false
    t.integer "age", null: false
    t.string "image", null: false
    t.text "content", null: false
    t.boolean "animal_status", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bleeds", force: :cascade do |t|
    t.integer "genre_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats", force: :cascade do |t|
    t.integer "demand_user_id", null: false
    t.integer "supply_user_id", null: false
    t.text "message", null: false
    t.string "which_from", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "demand_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.integer "job", null: false
    t.integer "age", null: false
    t.string "nickname", null: false
    t.boolean "is_deleted", default: false, null: false
    t.string "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_demand_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_demand_users_on_reset_password_token", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.integer "supply_user_id", null: false
    t.string "name", null: false
    t.string "day", null: false
    t.string "place", null: false
    t.string "image", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "demand_user_id", null: false
    t.integer "animal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supply_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "image", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "phone", null: false
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_supply_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_supply_users_on_reset_password_token", unique: true
  end

end
