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

ActiveRecord::Schema.define(version: 20151006122225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "subject_id"
    t.string   "zooniverse_user_id"
    t.string   "zooniverse_discussion_id"
    t.string   "zooniverse_comment_id"
    t.text     "body"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "mico_id"
    t.string   "mico_status"
    t.jsonb    "mico_data"
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "zooniverse_id"
    t.integer  "image_index"
    t.string   "image_url"
    t.string   "mico_id"
    t.string   "mico_status"
    t.string   "mico_url"
    t.jsonb    "mico_data"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "comments_count",              default: 0, null: false
    t.string   "zooniverse_dominant_species"
  end

  add_index "subjects", ["mico_id"], name: "index_subjects_on_mico_id", unique: true, using: :btree
  add_index "subjects", ["mico_status"], name: "index_subjects_on_mico_status", using: :btree
  add_index "subjects", ["zooniverse_dominant_species"], name: "index_subjects_on_zooniverse_dominant_species", using: :btree

end
