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

ActiveRecord::Schema.define(version: 2021_03_21_161711) do

  create_table "assets", force: :cascade do |t|
    t.integer "notification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notification_id"], name: "index_assets_on_notification_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.string "subject", null: false
    t.text "content", null: false
    t.integer "old_notification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["old_notification_id"], name: "index_notifications_on_old_notification_id"
    t.index ["recipient_id"], name: "index_notifications_on_recipient_id"
    t.index ["sender_id"], name: "index_notifications_on_sender_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "birthday", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
