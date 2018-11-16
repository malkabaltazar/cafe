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

ActiveRecord::Schema.define(version: 2018_11_02_014319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entity", primary_key: "entity_id", id: :serial, force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "nickname"
    t.integer "suffix_id"
    t.date "date_of_birth"
    t.bit "gender", limit: 1
    t.integer "entity_type_id"
    t.date "created_at"
    t.date "updated_at"
    t.string "username"
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.integer "prefix_id"
    t.index ["confirmation_token"], name: "index_entity_on_confirmation_token", unique: true
    t.index ["email"], name: "index_entity_on_email", unique: true
    t.index ["reset_password_token"], name: "index_entity_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_entity_on_unlock_token", unique: true
    t.index ["username"], name: "index_entity_on_username", unique: true
  end

  create_table "entity_type", primary_key: "entity_type_id", id: :serial, force: :cascade do |t|
    t.string "name", limit: 50, null: false
  end

  create_table "phone_number", primary_key: "phone_number_id", id: :serial, force: :cascade do |t|
    t.string "phone_number", limit: 10
    t.integer "entity_id"
    t.integer "phone_type_id"
    t.date "created_at"
    t.date "updated_at"
  end

  create_table "phone_type", primary_key: "phone_type_id", id: :serial, force: :cascade do |t|
    t.string "name", limit: 50, null: false
  end

  create_table "prefix", primary_key: "prefix_id", id: :serial, force: :cascade do |t|
    t.string "name", limit: 20, null: false
  end

  create_table "suffix", primary_key: "suffix_id", id: :serial, force: :cascade do |t|
    t.string "name", limit: 5, null: false
  end

end
