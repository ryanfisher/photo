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

ActiveRecord::Schema.define(version: 20150426225947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "url"
    t.string   "key"
    t.string   "thumbnail_url"
    t.string   "thumbnail_key"
    t.string   "optimized_url"
    t.string   "optimized_key"
    t.string   "original_filename"
    t.datetime "date_taken"
    t.integer  "width"
    t.integer  "height"
    t.integer  "size"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "sorted_photos", force: :cascade do |t|
    t.integer  "photo_id"
    t.integer  "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "sorted_photos", "albums"
  add_foreign_key "sorted_photos", "photos"
end
