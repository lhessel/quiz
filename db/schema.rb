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

ActiveRecord::Schema.define(version: 20150514175441) do

  create_table "questions", force: true do |t|
    t.string   "question"
    t.string   "answer0"
    t.string   "answer1"
    t.string   "answer2"
    t.string   "answer3"
    t.integer  "correctAnswer"
    t.integer  "difficulty"
    t.integer  "contributedBy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quizzes", force: true do |t|
    t.integer  "finalDifficulty"
    t.integer  "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quizzes_users", id: false, force: true do |t|
    t.integer "user_id", null: false
    t.integer "quiz_id", null: false
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.integer  "contributedQuestions", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  add_index "users", ["username"], name: "username", unique: true, using: :btree

end
