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

ActiveRecord::Schema.define(version: 2019_05_22_082319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "booking_no"
    t.date "booking_date"
    t.text "booking_note"
    t.string "navigation"
    t.date "shipment_date"
    t.date "ship_departure_date"
    t.decimal "average_arrival_day"
    t.decimal "document_delivery_time"
    t.date "invoice_date"
    t.date "payment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_header_id"
    t.index ["order_header_id"], name: "index_bookings_on_order_header_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "currency_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "firm_name"
    t.string "adress"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name"
    t.string "item_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "unit_id"
    t.index ["unit_id"], name: "index_items_on_unit_id"
  end

  create_table "navigations", force: :cascade do |t|
    t.string "title"
    t.boolean "is_visible"
    t.boolean "can_create"
    t.boolean "can_edit"
    t.boolean "can_delete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "path"
    t.index ["user_id"], name: "index_navigations_on_user_id"
  end

  create_table "order_headers", force: :cascade do |t|
    t.date "order_date"
    t.date "deadline"
    t.string "invoice_number"
    t.date "shipment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "currency_id"
    t.index ["currency_id"], name: "index_order_headers_on_currency_id"
  end

  create_table "prop_dets", force: :cascade do |t|
    t.decimal "quantity"
    t.decimal "unit_price"
    t.decimal "total_price"
    t.bigint "proposal_header_id"
    t.decimal "item_id"
    t.index ["proposal_header_id"], name: "index_prop_dets_on_proposal_header_id"
  end

  create_table "proposal_headers", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "currency_id"
    t.bigint "customer_id"
    t.index ["currency_id"], name: "index_proposal_headers_on_currency_id"
    t.index ["customer_id"], name: "index_proposal_headers_on_customer_id"
  end

  create_table "transporters", force: :cascade do |t|
    t.string "transporter_name"
    t.string "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "unit_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roles"
    t.string "username"
    t.string "type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "bookings", "order_headers"
  add_foreign_key "items", "units"
  add_foreign_key "navigations", "users"
  add_foreign_key "order_headers", "currencies"
  add_foreign_key "prop_dets", "proposal_headers"
  add_foreign_key "proposal_headers", "currencies"
  add_foreign_key "proposal_headers", "customers"
end
