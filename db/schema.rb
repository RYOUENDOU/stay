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

ActiveRecord::Schema.define(version: 20180208043721) do

  create_table "amenities", force: :cascade do |t|
    t.boolean "is_tv"
    t.boolean "is_kitchen"
    t.boolean "is_air"
    t.boolean "is_internet"
    t.boolean "is_parking"
    t.string "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotel_images", force: :cascade do |t|
    t.string "title"
    t.string "image_id"
    t.string "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string "hotel_type"
    t.string "room_type"
    t.integer "accomodate"
    t.integer "bedroom"
    t.integer "bathroom"
    t.text "name"
    t.text "summary"
    t.string "address"
    t.integer "price"
    t.boolean "active"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservation_calendars", force: :cascade do |t|
    t.date "select_date"
    t.string "hotel_id"
    t.boolean "status", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "hotel_id"
    t.integer "total"
    t.integer "guest_count"
    t.date "check_in", null: false
    t.date "check_out", null: false
    t.string "user_name"
    t.string "address"
    t.string "tel"
    t.text "request"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "nickname"
    t.integer "star"
    t.text "review"
    t.string "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
