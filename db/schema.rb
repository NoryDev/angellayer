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

ActiveRecord::Schema.define(version: 20150515080904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "fuzzystrmatch"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "evaluation_id"
    t.integer  "founder_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "comments", ["evaluation_id"], name: "index_comments_on_evaluation_id", using: :btree
  add_index "comments", ["founder_id"], name: "index_comments_on_founder_id", using: :btree

  create_table "evaluations", force: :cascade do |t|
    t.integer  "founder_id"
    t.text     "review"
    t.float    "rating_reputation"
    t.float    "rating_deal"
    t.float    "rating_pitch"
    t.float    "rating_competence"
    t.float    "rating_commitment"
    t.integer  "amount_raised"
    t.boolean  "would_work_again"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "title_review"
    t.integer  "investor_profile_id"
    t.float    "average_score"
  end

  add_index "evaluations", ["founder_id"], name: "index_evaluations_on_founder_id", using: :btree
  add_index "evaluations", ["investor_profile_id"], name: "index_evaluations_on_investor_profile_id", using: :btree

  create_table "founders", force: :cascade do |t|
    t.string   "email",                    default: "",    null: false
    t.string   "encrypted_password",       default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "angellist"
    t.string   "skype"
    t.string   "cell_phone"
    t.string   "website"
    t.text     "all_startups"
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
    t.boolean  "admin",                    default: false, null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "founders", ["confirmation_token"], name: "index_founders_on_confirmation_token", unique: true, using: :btree
  add_index "founders", ["email"], name: "index_founders_on_email", unique: true, using: :btree
  add_index "founders", ["reset_password_token"], name: "index_founders_on_reset_password_token", unique: true, using: :btree

  create_table "investor_profiles", force: :cascade do |t|
    t.string   "email"
    t.string   "company_name"
    t.text     "physical_address"
    t.string   "phone_number"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "angellist"
    t.string   "skype"
    t.string   "website"
    t.text     "sectors_invested_in"
    t.integer  "capital_under_managment"
    t.text     "geographical_focus"
    t.string   "preferred_investment_stage"
    t.integer  "nb_projects_invested_in"
    t.string   "contact_person"
    t.string   "contact_email"
    t.string   "contact_cell_phone"
    t.integer  "investor_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
    t.integer  "author_as_founder_id"
    t.integer  "author_as_investor_id"
    t.boolean  "author_is_founder"
    t.float    "total_average_score"
  end

  add_index "investor_profiles", ["investor_id"], name: "index_investor_profiles_on_investor_id", using: :btree

  create_table "investors", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "investors", ["email"], name: "index_investors_on_email", unique: true, using: :btree
  add_index "investors", ["reset_password_token"], name: "index_investors_on_reset_password_token", unique: true, using: :btree

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "team_members", force: :cascade do |t|
    t.integer  "investor_profile_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "job_title"
    t.string   "speciality"
    t.integer  "year_joined"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "angellist"
    t.string   "skype"
    t.string   "linkedin"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "team_members", ["investor_profile_id"], name: "index_team_members_on_investor_profile_id", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "founder_id"
    t.integer  "evaluation_id"
    t.boolean  "plus",          default: false, null: false
    t.boolean  "minus",         default: false, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "votes", ["evaluation_id"], name: "index_votes_on_evaluation_id", using: :btree
  add_index "votes", ["founder_id"], name: "index_votes_on_founder_id", using: :btree

  add_foreign_key "comments", "evaluations"
  add_foreign_key "comments", "founders"
  add_foreign_key "evaluations", "founders"
  add_foreign_key "evaluations", "investor_profiles"
  add_foreign_key "investor_profiles", "investors"
  add_foreign_key "team_members", "investor_profiles"
  add_foreign_key "votes", "evaluations"
  add_foreign_key "votes", "founders"
end
