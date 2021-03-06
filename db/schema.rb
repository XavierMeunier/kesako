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

ActiveRecord::Schema.define(version: 20150610011359) do

  create_table "answers", force: :cascade do |t|
    t.string   "content",     limit: 255
    t.integer  "question_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "correct",     limit: 1,   default: false
    t.boolean  "default",     limit: 1,   default: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "levels", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "difficulty", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "level_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["level_id"], name: "index_questions_on_level_id", using: :btree

  create_table "questions_sub_topics", id: false, force: :cascade do |t|
    t.integer "question_id",  limit: 4, null: false
    t.integer "sub_topic_id", limit: 4, null: false
  end

  add_index "questions_sub_topics", ["sub_topic_id", "question_id"], name: "index_questions_sub_topics_on_sub_topic_id_and_question_id", using: :btree

  create_table "sub_topics", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "topic_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_topics", ["topic_id"], name: "index_sub_topics_on_topic_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string "name", limit: 255
  end

end
