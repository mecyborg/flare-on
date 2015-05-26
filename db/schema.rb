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

ActiveRecord::Schema.define(version: 20150526151148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alltopics", force: :cascade do |t|
    t.string   "t_name",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ans_upvotes", force: :cascade do |t|
    t.string   "u_id",       limit: 255
    t.integer  "ans_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "user_id",        limit: 255
    t.text     "answer_content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credits", force: :cascade do |t|
    t.string   "u_id",       limit: 255
    t.string   "ans_id",     limit: 255
    t.integer  "u_value"
    t.string   "uid_from",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "user_to",    limit: 255
    t.string   "user_from",  limit: 255
    t.string   "noti_type",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ans_id",     limit: 255
  end

  create_table "post_quests", force: :cascade do |t|
    t.string   "ques_text",  limit: 255
    t.string   "t_id",       limit: 255
    t.string   "first",      limit: 255
    t.string   "upvote",     limit: 255
    t.string   "follow",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ques_follows", force: :cascade do |t|
    t.integer  "q_id"
    t.string   "email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "topic_follows", force: :cascade do |t|
    t.integer  "t_id"
    t.string   "email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",          limit: 255
    t.string   "last_name",           limit: 255
    t.string   "email",               limit: 255
    t.string   "password_hash",       limit: 255
    t.string   "password_salt",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_name",        limit: 255
    t.string   "bio",                 limit: 255
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "admin_role",                      default: false
    t.string   "name",                limit: 255
  end

end
