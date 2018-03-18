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

ActiveRecord::Schema.define(version: 20180318003743) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "addresses", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "address_type"
    t.integer  "created_by",   null: false
    t.integer  "updated_by",   null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["client_id"], name: "index_addresses_on_client_id", using: :btree
  end

  create_table "apprenticeships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "career_plan_outcomes", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "job_seeker_id"
    t.integer  "activity"
    t.date     "start_date"
    t.integer  "planned_hours"
    t.integer  "completed"
    t.string   "reason"
    t.text     "outcome"
    t.integer  "created_by",    null: false
    t.integer  "updated_by",    null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "suffix"
    t.date     "dob"
    t.integer  "gender"
    t.string   "email"
    t.string   "goals",                    array: true
    t.string   "barriers",                 array: true
    t.integer  "created_by",  null: false
    t.integer  "updated_by",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "company_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "education_details", force: :cascade do |t|
    t.integer  "education_id"
    t.integer  "category"
    t.integer  "course"
    t.integer  "status"
    t.integer  "score"
    t.integer  "created_by",   null: false
    t.integer  "updated_by",   null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "education_planners", force: :cascade do |t|
    t.integer  "career_plan_outcome_id"
    t.integer  "event_id"
    t.date     "activity_date"
    t.string   "school_name"
    t.string   "point_of_contact"
    t.string   "program"
    t.string   "major"
    t.integer  "class_hours_per_week"
    t.integer  "completed"
    t.text     "outcome"
    t.integer  "job_seeker_id"
    t.integer  "created_by",             null: false
    t.integer  "updated_by",             null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["career_plan_outcome_id"], name: "index_education_planners_on_career_plan_outcome_id", using: :btree
  end

  create_table "educations", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "school_name"
    t.integer  "attendance_type"
    t.date     "effective_beg_date"
    t.date     "effective_end_date"
    t.string   "major_study"
    t.integer  "high_grade_level"
    t.date     "expected_grad_date"
    t.date     "degree_obtained"
    t.integer  "created_by",         null: false
    t.integer  "updated_by",         null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["client_id"], name: "index_educations_on_client_id", using: :btree
  end

  create_table "employments", force: :cascade do |t|
    t.integer  "career_plan_outcomes_id"
    t.string   "work_site_name"
    t.string   "point_of_contact"
    t.string   "occupation"
    t.integer  "position_type"
    t.decimal  "salary_per_hour",         precision: 5, scale: 2
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "working_hours_per_week"
    t.integer  "completed"
    t.text     "outcome"
    t.integer  "created_by",                                      null: false
    t.integer  "updated_by",                                      null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["career_plan_outcomes_id"], name: "index_employments_on_career_plan_outcomes_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.integer  "resource_id"
    t.string   "title"
    t.datetime "start"
    t.datetime "end"
    t.string   "color"
    t.integer  "job_seeker_id"
    t.string   "name"
    t.string   "contact"
    t.integer  "hours"
    t.string   "outcome"
    t.string   "occupation_program"
    t.string   "position_major"
    t.hstore   "month_to_complete"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["resource_id"], name: "index_events_on_resource_id", using: :btree
  end

  create_table "master_domain_items", force: :cascade do |t|
    t.integer  "master_domain_id"
    t.string   "value"
    t.string   "short_description"
    t.string   "long_description"
    t.boolean  "status"
    t.string   "usage"
    t.integer  "created_by",        null: false
    t.integer  "updated_by",        null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "master_domains", force: :cascade do |t|
    t.string   "description"
    t.integer  "created_by",  null: false
    t.integer  "updated_by",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["description"], name: "index_master_domains_on_description", unique: true, using: :btree
  end

  create_table "reminders", force: :cascade do |t|
    t.integer  "jobseeker_id"
    t.string   "description"
    t.integer  "status"
    t.integer  "type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "resources", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_assessements", force: :cascade do |t|
    t.integer  "student_id"
    t.date     "assessement_date"
    t.string   "assessement_answers"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "name"
    t.integer  "role"
    t.integer  "company_id"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",      default: 0
    t.string   "last_name"
    t.string   "first_name"
    t.index ["company_id"], name: "index_users_on_company_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
    t.index ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "work_search_blogs", force: :cascade do |t|
    t.integer  "career_plan_outcome_id"
    t.integer  "event_id"
    t.date     "activity_date"
    t.integer  "hours_spent"
    t.text     "work_site_name"
    t.text     "address1"
    t.text     "address2"
    t.text     "city"
    t.text     "state"
    t.integer  "zip"
    t.text     "person_contacted"
    t.text     "contact_outcome"
    t.text     "comments"
    t.integer  "job_seeker_id"
    t.integer  "created_by",             null: false
    t.integer  "updated_by",             null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["career_plan_outcome_id"], name: "index_work_search_blogs_on_career_plan_outcome_id", using: :btree
  end

  create_table "work_site_planners", force: :cascade do |t|
    t.integer  "career_plan_outcome_id"
    t.integer  "event_id"
    t.date     "activity_date"
    t.string   "work_site_name"
    t.string   "point_of_contact"
    t.string   "occupation"
    t.integer  "position_type"
    t.decimal  "salary_per_hour",        precision: 5, scale: 2
    t.integer  "working_hours_per_week"
    t.integer  "completed"
    t.string   "outcome"
    t.integer  "job_seeker_id"
    t.integer  "created_by",                                     null: false
    t.integer  "updated_by",                                     null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["career_plan_outcome_id"], name: "index_work_site_planners_on_career_plan_outcome_id", using: :btree
  end

end
