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

ActiveRecord::Schema.define(version: 20140924210835) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "avatars", force: true do |t|
    t.integer  "experiment_id",                null: false
    t.string   "name",                         null: false
    t.boolean  "active",        default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiments", force: true do |t|
    t.string   "name",                      null: false
    t.boolean  "running",    default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url_slug",                  null: false
  end

  add_index "experiments", ["url_slug"], name: "index_experiments_on_url_slug", unique: true, using: :btree

  create_table "images", force: true do |t|
    t.string   "imageable_type",                    null: false
    t.integer  "imageable_id",                      null: false
    t.string   "type",                              null: false
    t.string   "content_type",                      null: false
    t.integer  "height"
    t.integer  "width"
    t.binary   "data",           limit: 2147483647
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["type", "imageable_type", "imageable_id"], name: "index_images_on_type_and_imageable_type_and_imageable_id", using: :btree

  create_table "participants", force: true do |t|
    t.string   "participant_tag", null: false
    t.integer  "experiment_id",   null: false
    t.integer  "avatar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participants", ["experiment_id", "participant_tag"], name: "index_participants_on_experiment_id_and_participant_tag", unique: true, using: :btree

  create_table "prompts", force: true do |t|
    t.integer  "experiment_id",             null: false
    t.string   "text",                      null: false
    t.integer  "position",      default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", force: true do |t|
    t.integer  "participant_id",                 null: false
    t.integer  "prompt_id",                      null: false
    t.boolean  "completed",      default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responses", ["participant_id", "prompt_id"], name: "index_responses_on_participant_id_and_prompt_id", unique: true, using: :btree

end
