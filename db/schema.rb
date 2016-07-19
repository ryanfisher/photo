# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160719045806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "albums", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id",                 null: false
    t.integer  "photo_id"
    t.integer  "theme_id"
    t.string   "stub",       default: "", null: false
  end

  add_index "albums", ["photo_id"], name: "index_albums_on_photo_id", using: :btree
  add_index "albums", ["theme_id"], name: "index_albums_on_theme_id", using: :btree

  create_table "buckets", force: :cascade do |t|
    t.string   "name"
    t.string   "encrypted_access_key_id"
    t.string   "encrypted_secret_access_key"
    t.integer  "provider"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "original_filename"
    t.datetime "date_taken"
    t.integer  "width"
    t.integer  "height"
    t.integer  "size"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id",           null: false
    t.hstore   "exif"
    t.string   "file_key",          null: false
    t.string   "url",               null: false
    t.string   "thumb_url"
    t.string   "signature"
    t.string   "optimized_url"
  end

  create_table "public_tags", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "public_tags", ["photo_id"], name: "index_public_tags_on_photo_id", using: :btree
  add_index "public_tags", ["tag_id"], name: "index_public_tags_on_tag_id", using: :btree

  create_table "sorted_photos", force: :cascade do |t|
    t.integer  "photo_id"
    t.integer  "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "position"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.integer  "bucket_id"
  end

  add_index "users", ["bucket_id"], name: "index_users_on_bucket_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.integer  "photo_id",               null: false
    t.integer  "type",       default: 0, null: false
    t.string   "url",                    null: false
    t.integer  "width",                  null: false
    t.integer  "height",                 null: false
    t.string   "note"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "albums", "photos"
  add_foreign_key "albums", "themes"
  add_foreign_key "albums", "users"
  add_foreign_key "photos", "users"
  add_foreign_key "sorted_photos", "albums"
  add_foreign_key "sorted_photos", "photos"
  add_foreign_key "users", "buckets"
end
