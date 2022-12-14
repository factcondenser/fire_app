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

ActiveRecord::Schema[7.0].define(version: 2022_12_17_155442) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "expense_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", limit: 63, null: false
    t.string "background_color", null: false
    t.string "foreground_color", null: false
    t.uuid "parent_id"
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_expense_categories_on_parent_id"
    t.index ["user_id", "name", "parent_id"], name: "index_expense_categories_on_user_id_and_name_and_parent_id", unique: true
    t.check_constraint "regexp_like(background_color::text, '\\A#[a-f0-9]{2}[a-f0-9]{2}[a-f0-9]{2}\\Z'::text)"
    t.check_constraint "regexp_like(foreground_color::text, '\\A#[a-f0-9]{2}[a-f0-9]{2}[a-f0-9]{2}\\Z'::text)"
  end

  create_table "expenses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "amount_cents", null: false
    t.string "description", limit: 255
    t.datetime "incurred_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.uuid "created_by_id", null: false
    t.uuid "incurred_by_id", null: false
    t.uuid "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id", "incurred_by_id", "incurred_at", "category_id"], name: "idx_expenses_on_created_by_incurred_by_incurred_at_and_category"
    t.index ["created_by_id", "incurred_by_id", "updated_at", "category_id"], name: "idx_expenses_on_created_by_incurred_by_updated_at_and_category"
  end

  create_table "income_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", limit: 63, null: false
    t.string "background_color", null: false
    t.string "foreground_color", null: false
    t.uuid "parent_id"
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_income_categories_on_parent_id"
    t.index ["user_id", "name", "parent_id"], name: "index_income_categories_on_user_id_and_name_and_parent_id", unique: true
    t.check_constraint "regexp_like(background_color::text, '\\A#[a-f0-9]{2}[a-f0-9]{2}[a-f0-9]{2}\\Z'::text)"
    t.check_constraint "regexp_like(foreground_color::text, '\\A#[a-f0-9]{2}[a-f0-9]{2}[a-f0-9]{2}\\Z'::text)"
  end

  create_table "incomes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "amount_cents", null: false
    t.string "description", limit: 255
    t.datetime "incurred_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.uuid "created_by_id", null: false
    t.uuid "incurred_by_id", null: false
    t.uuid "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id", "incurred_by_id", "incurred_at", "category_id"], name: "idx_incomes_on_created_by_incurred_by_incurred_at_and_category"
    t.index ["created_by_id", "incurred_by_id", "updated_at", "category_id"], name: "idx_incomes_on_created_by_incurred_by_updated_at_and_category"
  end

  create_table "labelings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "labelable_id", null: false
    t.string "labelable_type", null: false
    t.uuid "label_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label_id"], name: "index_labelings_on_label_id"
    t.index ["labelable_id", "label_id"], name: "index_labelings_on_labelable_id_and_label_id", unique: true
  end

  create_table "labels", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", limit: 63, null: false
    t.string "background_color", null: false
    t.string "foreground_color", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "name"], name: "index_labels_on_user_id_and_name", unique: true
    t.check_constraint "regexp_like(background_color::text, '\\A#[a-f0-9]{2}[a-f0-9]{2}[a-f0-9]{2}\\Z'::text)"
    t.check_constraint "regexp_like(foreground_color::text, '\\A#[a-f0-9]{2}[a-f0-9]{2}[a-f0-9]{2}\\Z'::text)"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.citext "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "expense_categories", "expense_categories", column: "parent_id"
  add_foreign_key "expense_categories", "users"
  add_foreign_key "expenses", "expense_categories", column: "category_id"
  add_foreign_key "expenses", "users", column: "created_by_id"
  add_foreign_key "expenses", "users", column: "incurred_by_id"
  add_foreign_key "income_categories", "income_categories", column: "parent_id"
  add_foreign_key "income_categories", "users"
  add_foreign_key "incomes", "income_categories", column: "category_id"
  add_foreign_key "incomes", "users", column: "created_by_id"
  add_foreign_key "incomes", "users", column: "incurred_by_id"
  add_foreign_key "labelings", "labels"
  add_foreign_key "labels", "users"
end
