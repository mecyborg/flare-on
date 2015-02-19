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

ActiveRecord::Schema.define(version: 20150207220059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alltopics", force: true do |t|
    t.string   "t_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ans_upvotes", force: true do |t|
    t.string   "u_id"
    t.integer  "ans_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answer_upvotes", force: true do |t|
    t.string   "answer_id"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.string   "user_id"
    t.string   "answer_content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authorizations", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credits", force: true do |t|
    t.string   "u_id"
    t.string   "ans_id"
    t.integer  "u_value"
    t.string   "uid_from"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "file_uploads", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.string   "user_to"
    t.string   "user_from"
    t.string   "noti_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ans_id"
  end

  create_table "post_attachments", force: true do |t|
    t.integer  "user_id"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_quests", force: true do |t|
    t.string   "ques_text"
    t.string   "t_id"
    t.string   "first"
    t.string   "upvote"
    t.string   "follow"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ques", force: true do |t|
    t.string   "Ques"
    t.string   "Category"
    t.boolean  "Upvote"
    t.boolean  "follow"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ques_follows", force: true do |t|
    t.integer  "q_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_follows", force: true do |t|
    t.string   "question_id"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topic_follows", force: true do |t|
    t.integer  "t_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_name"
    t.string   "profile_id",                          null: false
    t.string   "bio"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "admin_role",          default: false
    t.string   "name"
  end

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
