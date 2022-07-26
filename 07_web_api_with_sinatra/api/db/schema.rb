# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_26_003119) do

  create_table "handlers", force: :cascade do |t|
    t.string "email"
    t.integer "phone"
    t.string "name"
  end

  create_table "owners", force: :cascade do |t|
    t.string "email"
    t.string "address"
    t.integer "phone"
    t.string "username"
  end

  create_table "pets", force: :cascade do |t|
    t.string "breed"
    t.string "name"
    t.string "image_url"
    t.integer "age"
    t.integer "owner_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "request"
    t.datetime "time"
    t.integer "pet_id"
    t.integer "handler_id"
  end

end
