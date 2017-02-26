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

ActiveRecord::Schema.define(version: 20170223164549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "choices", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid    "quiz_item_id"
    t.text    "content"
    t.boolean "is_correct"
    t.index ["quiz_item_id", "content"], name: "index_choices_on_quiz_item_id_and_content", using: :btree
  end

  create_table "question_types", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string  "question_type"
    t.integer "min_options"
    t.integer "max_options"
    t.integer "min_answers"
    t.integer "max_answers"
  end

  create_table "quiz_answer_keys", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string  "title"
    t.decimal "passing_rate"
    t.integer "time_limit"
    t.boolean "is_randomized"
    t.index ["title"], name: "index_quiz_answer_keys_on_title", using: :btree
  end

  create_table "quiz_items", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid    "quiz_answer_key_id"
    t.uuid    "question_type_id"
    t.integer "sequence_number"
    t.text    "question"
    t.text    "instructions"
    t.decimal "point"
    t.index ["quiz_answer_key_id", "question"], name: "index_quiz_items_on_quiz_answer_key_id_and_question", using: :btree
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
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
    t.string   "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
