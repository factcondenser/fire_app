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
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "expense_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", limit: 63, null: false
    t.uuid "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "parent_id"], name: "index_expense_categories_on_name_and_parent_id", unique: true
    t.index ["parent_id"], name: "index_expense_categories_on_parent_id"
  end

  create_table "expenses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "amount_cents", null: false
    t.string "description", limit: 255
    t.datetime "incurred_at", null: false
    t.uuid "user_id", null: false
    t.uuid "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "category_id", "incurred_at"], name: "index_expenses_on_user_id_and_category_id_and_incurred_at"
    t.index ["user_id", "incurred_at"], name: "index_expenses_on_user_id_and_incurred_at"
  end

  create_table "income_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", limit: 63, null: false
    t.uuid "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "parent_id"], name: "index_income_categories_on_name_and_parent_id", unique: true
    t.index ["parent_id"], name: "index_income_categories_on_parent_id"
  end

  create_table "incomes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "amount_cents", null: false
    t.string "description", limit: 255
    t.datetime "incurred_at", null: false
    t.uuid "user_id", null: false
    t.uuid "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "category_id", "incurred_at"], name: "index_incomes_on_user_id_and_category_id_and_incurred_at"
    t.index ["user_id", "incurred_at"], name: "index_incomes_on_user_id_and_incurred_at"
  end

  create_table "labelings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "label_id", null: false
    t.uuid "labelable_id", null: false
    t.string "labelable_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["labelable_id"], name: "index_labelings_on_labelable_id"
    t.index ["user_id", "label_id"], name: "index_labelings_on_user_id_and_label_id"
  end

  create_table "labels", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", limit: 63, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_labels_on_name", unique: true
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "expense_categories", "expense_categories", column: "parent_id"
  add_foreign_key "expenses", "expense_categories", column: "category_id"
  add_foreign_key "expenses", "users"
  add_foreign_key "income_categories", "income_categories", column: "parent_id"
  add_foreign_key "incomes", "income_categories", column: "category_id"
  add_foreign_key "incomes", "users"
  add_foreign_key "labelings", "labels"
  add_foreign_key "labelings", "users"
end
