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

ActiveRecord::Schema.define(version: 20150303131653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evaluations", force: :cascade do |t|
    t.integer  "investor_id"
    t.integer  "founder_id"
    t.text     "review"
    t.float    "rating_reputation"
    t.float    "rating_deal"
    t.float    "rating_pitch"
    t.float    "rating_competence"
    t.float    "rating_commitment"
    t.integer  "amount_raised"
    t.boolean  "would_work_again"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "title_review"
  end

  add_index "evaluations", ["founder_id"], name: "index_evaluations_on_founder_id", using: :btree
  add_index "evaluations", ["investor_id"], name: "index_evaluations_on_investor_id", using: :btree

  create_table "founders", force: :cascade do |t|
    t.string   "email",                    default: "", null: false
    t.string   "encrypted_password",       default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,  null: false
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
  end

  add_index "founders", ["email"], name: "index_founders_on_email", unique: true, using: :btree
  add_index "founders", ["reset_password_token"], name: "index_founders_on_reset_password_token", unique: true, using: :btree

  create_table "investors", force: :cascade do |t|
    t.string   "email",                      default: "", null: false
    t.string   "encrypted_password",         default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company_name"
    t.text     "physical_address"
    t.text     "phone_number"
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
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
  end

  add_index "investors", ["email"], name: "index_investors_on_email", unique: true, using: :btree
  add_index "investors", ["reset_password_token"], name: "index_investors_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "evaluations", "founders"
  add_foreign_key "evaluations", "investors"
end
