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

ActiveRecord::Schema.define(version: 2019_11_20_232959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appraisals", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "appraiser_id"
    t.integer "working_software"
    t.integer "process"
    t.integer "pitch"
    t.integer "inovation"
    t.integer "team_formation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appraiser_id"], name: "index_appraisals_on_appraiser_id"
    t.index ["team_id"], name: "index_appraisals_on_team_id"
  end

  create_table "appraisers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.bigint "team_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "new_appraisal"
    t.boolean "presented"
    t.index ["course_id"], name: "index_students_on_course_id"
    t.index ["team_id"], name: "index_students_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appraisals", "appraisers"
  add_foreign_key "appraisals", "teams"
  add_foreign_key "students", "courses"
  add_foreign_key "students", "teams"
end
