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

ActiveRecord::Schema.define(version: 20160722114434) do

  create_table "emergencies", force: :cascade do |t|
    t.string   "reason"
    t.integer  "fire_need"
    t.integer  "police_need"
    t.integer  "medical_need"
    t.string   "city"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "responders", force: :cascade do |t|
    t.string   "name"
    t.string   "responder_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "city"
  end

end
