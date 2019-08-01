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

ActiveRecord::Schema.define(version: 2019_05_09_190547) do

  create_table "adjustments", force: :cascade do |t|
    t.string "adj_type"
    t.string "description", default: "Enter description here"
    t.float "adj_amount", default: 9999.99
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "company_id"
    t.string "pay_type"
    t.float "pay_rate"
    t.boolean "active", default: true
    t.string "filing_status", default: "Single"
    t.integer "allowances", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_employees_on_company_id"
  end

  create_table "paycheck_adjustments", force: :cascade do |t|
    t.integer "paycheck_id"
    t.string "adj_type"
    t.string "description", default: "Enter description here"
    t.float "adj_amount", default: 9999.99
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paychecks", force: :cascade do |t|
    t.integer "payroll_id"
    t.integer "employee_id"
    t.float "hours", default: 0.0
    t.float "vacation_hours", default: 0.0
    t.float "pto_hours", default: 0.0
    t.float "sick_hours", default: 0.0
    t.float "holiday_hours", default: 0.0
    t.float "ot_hours", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payrolls", force: :cascade do |t|
    t.integer "company_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "check_date"
    t.string "status"
  end

end
