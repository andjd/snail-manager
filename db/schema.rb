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

ActiveRecord::Schema.define(version: 20160717192544) do

  create_table "domestic_addresses", force: :cascade do |t|
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "international_addresses", force: :cascade do |t|
    t.string   "address"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailings", force: :cascade do |t|
    t.string   "type"
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "date"
    t.index ["date"], name: "index_mailings_on_date"
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "formal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["formal"], name: "index_people_on_formal"
    t.index ["name"], name: "index_people_on_name"
  end

  create_table "people_addresses", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "address_id"
    t.string   "address_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "send_receives", force: :cascade do |t|
    t.integer  "person_id"
    t.boolean  "sent"
    t.boolean  "received"
    t.integer  "mailing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timeshares", force: :cascade do |t|
    t.integer  "address_id"
    t.string   "address_type"
    t.date     "valid_from"
    t.date     "valid_to"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["address_id"], name: "index_timeshares_on_address_id"
    t.index ["valid_from"], name: "index_timeshares_on_valid_from"
    t.index ["valid_to"], name: "index_timeshares_on_valid_to"
  end

end
