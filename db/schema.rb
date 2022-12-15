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

ActiveRecord::Schema[7.0].define(version: 2022_12_15_144723) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "properties", force: :cascade do |t|
    t.integer "host_id", null: false
    t.string "host_name", null: false
    t.string "property_name", null: false
    t.text "description", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.float "price", null: false
    t.integer "num_beds", null: false
    t.integer "num_baths", null: false
    t.float "lng", null: false
    t.float "lat", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rh_franchise", null: false
    t.index ["city"], name: "index_properties_on_city"
    t.index ["host_id"], name: "index_properties_on_host_id"
    t.index ["state"], name: "index_properties_on_state"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "guest_id", null: false
    t.integer "property_id", null: false
    t.date "check_in_date", null: false
    t.date "check_out_date", null: false
    t.integer "num_guests", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_reservations_on_guest_id"
    t.index ["property_id"], name: "index_reservations_on_property_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "guest_id", null: false
    t.integer "property_id", null: false
    t.integer "rating", null: false
    t.text "review", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reviewer_name"
    t.string "review_date"
    t.index ["guest_id"], name: "index_reviews_on_guest_id"
    t.index ["property_id"], name: "index_reviews_on_property_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.string "rh_franchise"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["rh_franchise"], name: "index_users_on_rh_franchise"
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "properties", "users", column: "host_id"
  add_foreign_key "reservations", "properties"
  add_foreign_key "reservations", "users", column: "guest_id"
  add_foreign_key "reviews", "properties"
  add_foreign_key "reviews", "users", column: "guest_id"
end
