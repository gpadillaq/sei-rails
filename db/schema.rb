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

ActiveRecord::Schema.define(version: 20161201194628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "answer_types", force: :cascade do |t|
    t.text     "descripcion"
    t.decimal  "scala"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "answers", force: :cascade do |t|
    t.integer  "user_type_id"
    t.text     "descripcion"
    t.integer  "answer_type_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["answer_type_id"], name: "index_answers_on_answer_type_id", using: :btree
    t.index ["user_type_id"], name: "index_answers_on_user_type_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.text     "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "intervals", force: :cascade do |t|
    t.text     "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "levels", force: :cascade do |t|
    t.text     "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_types", force: :cascade do |t|
    t.text     "codigo"
    t.text     "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "user_type_id"
    t.text     "descripcion"
    t.integer  "question_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["question_type_id"], name: "index_questions_on_question_type_id", using: :btree
    t.index ["user_type_id"], name: "index_questions_on_user_type_id", using: :btree
  end

  create_table "subjects", force: :cascade do |t|
    t.text     "codigo"
    t.text     "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_comments", force: :cascade do |t|
    t.integer  "user_survey_id"
    t.text     "descripcion"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_survey_id"], name: "index_survey_comments_on_user_survey_id", using: :btree
  end

  create_table "survey_results", force: :cascade do |t|
    t.integer  "user_survey_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["answer_id"], name: "index_survey_results_on_answer_id", using: :btree
    t.index ["question_id"], name: "index_survey_results_on_question_id", using: :btree
    t.index ["user_survey_id"], name: "index_survey_results_on_user_survey_id", using: :btree
  end

  create_table "surveys", force: :cascade do |t|
    t.text     "nombre"
    t.date     "inicio"
    t.date     "fin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "active"
  end

  create_table "user_surveys", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "user_type_id"
    t.integer  "level_id"
    t.integer  "group_id"
    t.integer  "interval_id"
    t.integer  "subject_id"
    t.boolean  "activa"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "survey_id"
    t.integer  "docente_id"
    t.index ["docente_id"], name: "index_user_surveys_on_docente_id", using: :btree
    t.index ["group_id"], name: "index_user_surveys_on_group_id", using: :btree
    t.index ["interval_id"], name: "index_user_surveys_on_interval_id", using: :btree
    t.index ["level_id"], name: "index_user_surveys_on_level_id", using: :btree
    t.index ["subject_id"], name: "index_user_surveys_on_subject_id", using: :btree
    t.index ["survey_id"], name: "index_user_surveys_on_survey_id", using: :btree
    t.index ["user_id"], name: "index_user_surveys_on_user_id", using: :btree
    t.index ["user_type_id"], name: "index_user_surveys_on_user_type_id", using: :btree
  end

  create_table "user_types", force: :cascade do |t|
    t.text     "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "codigo"
    t.text     "nombre"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "answers", "answer_types"
  add_foreign_key "answers", "user_types"
  add_foreign_key "questions", "question_types"
  add_foreign_key "questions", "user_types"
  add_foreign_key "survey_comments", "user_surveys"
  add_foreign_key "survey_results", "answers"
  add_foreign_key "survey_results", "questions"
  add_foreign_key "survey_results", "user_surveys"
  add_foreign_key "user_surveys", "groups"
  add_foreign_key "user_surveys", "intervals"
  add_foreign_key "user_surveys", "levels"
  add_foreign_key "user_surveys", "subjects"
  add_foreign_key "user_surveys", "surveys"
  add_foreign_key "user_surveys", "user_types"
  add_foreign_key "user_surveys", "users"
  add_foreign_key "user_surveys", "users", column: "docente_id"
end
