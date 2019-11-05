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

ActiveRecord::Schema.define(version: 2019_11_04_091954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "adminpack"
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.string "description"
    t.string "organizer_name"
    t.string "organizer_email"
    t.string "organizer_contact_no"
    t.string "venue"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "county"
    t.string "country"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "publish_time"
    t.string "reserved_seating"
    t.string "sponsored"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "picture"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "no_of_tickets"
    t.decimal "ticket_price"
    t.decimal "fees_per_ticket"
    t.decimal "actual_ticket_price"
    t.decimal "organizer_payout_per_ticket"
    t.decimal "total_ticket_price"
    t.decimal "total_fees"
    t.decimal "total_actual_ticket_price"
    t.decimal "total_organizer_payout"
    t.string "currency"
    t.string "guest_first_name"
    t.string "guest_last_name"
    t.string "guest_email"
    t.string "guest_contact_no"
    t.string "payment_method"
    t.decimal "card_no"
    t.date "expiry_date"
    t.date "order_date"
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.bigint "ticket_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_orders_on_event_id"
    t.index ["ticket_id"], name: "index_orders_on_ticket_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "ratings", id: :serial, force: :cascade do |t|
    t.decimal "user_rating", precision: 2
    t.string "user_review"
    t.date "rating_date"
    t.bigint "user_id"
    t.bigint "event_id"
    t.bigint "ticket_id"
    t.date "created_at"
    t.date "updated_at"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "subscribed_user_id"
    t.date "subscription_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "entry_type"
    t.string "ticket_type"
    t.string "category"
    t.string "description"
    t.decimal "total_quantity"
    t.decimal "ticket_price"
    t.string "include_fees_in_ticket_price"
    t.decimal "fees_per_ticket"
    t.decimal "actual_ticket_price"
    t.decimal "organizer_payout_per_ticket"
    t.datetime "sale_start_time"
    t.datetime "sale_end_time"
    t.string "currency"
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "available_quantity"
    t.index ["event_id"], name: "index_tickets_on_event_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "email"
    t.string "contact_no"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "county"
    t.string "country"
    t.string "interest1"
    t.string "interest2"
    t.string "interest3"
    t.string "interest4"
    t.string "interest5"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wishlists", force: :cascade do |t|
    t.date "wishlist_date"
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "event_name"
    t.index ["event_id"], name: "index_wishlists_on_event_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "orders", "events"
  add_foreign_key "orders", "tickets"
  add_foreign_key "ratings", "events", name: "ratings_event_id_fkey"
  add_foreign_key "ratings", "tickets", name: "ratings_ticket_id_fkey"
  add_foreign_key "ratings", "users", name: "ratings_user_id_fkey"
  add_foreign_key "tickets", "events"
  add_foreign_key "wishlists", "events"
end
