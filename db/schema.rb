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

ActiveRecord::Schema[8.0].define(version: 2025_09_12_082151) do
  create_table "authors", force: :cascade do |t|
    t.string "fname", null: false
    t.string "lname"
    t.integer "birth_year"
    t.integer "death_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "biographies", force: :cascade do |t|
    t.text "biography"
    t.integer "quote_id", null: false
    t.integer "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_biographies_on_author_id"
    t.index ["quote_id"], name: "index_biographies_on_quote_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_quotes", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "quote_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_quotes_on_category_id"
    t.index ["quote_id"], name: "index_category_quotes_on_quote_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.text "quote", null: false
    t.integer "pub_year"
    t.text "comment"
    t.boolean "is_visible", default: true
    t.date "upload_date", default: -> { "CURRENT_DATE" }
    t.integer "user_id", null: false
    t.integer "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_quotes_on_author_id"
    t.index ["user_id"], name: "index_quotes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "fname", null: false
    t.string "lname", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "is_admin", default: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "biographies", "authors"
  add_foreign_key "biographies", "quotes"
  add_foreign_key "category_quotes", "categories"
  add_foreign_key "category_quotes", "quotes"
  add_foreign_key "quotes", "authors"
  add_foreign_key "quotes", "users"
end
