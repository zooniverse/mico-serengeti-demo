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

ActiveRecord::Schema.define(version: 20151120110028) do

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
    t.string   "mico_url"
  end

  create_table "consensus", force: :cascade do |t|
    t.string  "zooniverse_id"
    t.string  "season"
    t.string  "site_id"
    t.integer "frames"
    t.string  "time_of_day"
    t.integer "classifications"
    t.string  "crowd_says"
    t.integer "total_species"
    t.integer "total_animals"
    t.string  "crowd_says_if_multi"
    t.string  "retire_reason"
    t.string  "counters_keys"
    t.string  "counters_values"
    t.string  "species_counts_keys"
    t.string  "species_counts_values"
    t.string  "behavior_counters_keys"
    t.string  "behavior_counters_values"
    t.string  "aggregate_species_names"
    t.string  "aggregate_species_counts"
    t.string  "roll_id"
  end

  add_index "consensus", ["zooniverse_id"], name: "index_consensus_on_zooniverse_id", using: :btree

  create_table "que_jobs", id: false, force: :cascade do |t|
    t.integer  "priority",    limit: 2, default: 100,                                        null: false
    t.datetime "run_at",                default: "now()",                                    null: false
    t.integer  "job_id",      limit: 8, default: "nextval('que_jobs_job_id_seq'::regclass)", null: false
    t.text     "job_class",                                                                  null: false
    t.json     "args",                  default: [],                                         null: false
    t.integer  "error_count",           default: 0,                                          null: false
    t.text     "last_error"
    t.text     "queue",                 default: "",                                         null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "zooniverse_id"
    t.integer  "image_index"
    t.string   "image_url"
    t.string   "mico_id"
    t.string   "mico_status"
    t.string   "mico_url"
    t.jsonb    "mico_data"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "comments_count",                   default: 0, null: false
    t.string   "zooniverse_dominant_species"
    t.string   "subject_group_id",                             null: false
    t.datetime "image_timestamp"
    t.datetime "mico_submitted_at"
    t.datetime "mico_finished_at"
    t.string   "light"
    t.boolean  "entire_dataset"
    t.boolean  "daytime"
    t.boolean  "nighttime"
    t.boolean  "blank"
    t.boolean  "non_blank"
    t.boolean  "one_animal"
    t.boolean  "simple"
    t.boolean  "complex"
    t.boolean  "single_species"
    t.boolean  "only_buffalo"
    t.boolean  "only_elephant"
    t.boolean  "only_ostrich"
    t.boolean  "only_warthog"
    t.boolean  "only_wildebeest"
    t.boolean  "only_other"
    t.boolean  "multi_species"
    t.boolean  "multi_including_buffalo"
    t.boolean  "multi_including_elephant"
    t.boolean  "multi_including_ostrich"
    t.boolean  "multi_including_warthog"
    t.boolean  "multi_including_wildebeest"
    t.boolean  "multi_including_none_of_the_five"
  end

  add_index "subjects", ["mico_id"], name: "index_subjects_on_mico_id", unique: true, using: :btree
  add_index "subjects", ["mico_status"], name: "index_subjects_on_mico_status", using: :btree
  add_index "subjects", ["zooniverse_dominant_species"], name: "index_subjects_on_zooniverse_dominant_species", using: :btree

end
