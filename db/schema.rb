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

ActiveRecord::Schema.define(version: 2022_08_29_070429) do

  create_table "account_books", force: :cascade do |t|
    t.integer "end_user_id"
    t.integer "source_of_income_id"
    t.integer "income", default: 0
    t.datetime "pay_day", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "book_date"
    t.index ["end_user_id"], name: "index_account_books_on_end_user_id"
    t.index ["source_of_income_id"], name: "index_account_books_on_source_of_income_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "bop_details", force: :cascade do |t|
    t.integer "bop_subject_id"
    t.string "detail_name", null: false
    t.integer "detail_price", null: false
    t.integer "amount", null: false
    t.integer "registered_person_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bop_subject_id"], name: "index_bop_details_on_bop_subject_id"
  end

  create_table "bop_subjects", force: :cascade do |t|
    t.integer "end_user_id"
    t.string "subject_name"
    t.integer "bop"
    t.integer "total_price", null: false
    t.datetime "date", null: false
    t.integer "point"
    t.string "memo"
    t.string "store"
    t.integer "registered_person_id"
    t.integer "share_end_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["end_user_id"], name: "index_bop_subjects_on_end_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "end_user_id"
    t.integer "consultation_id"
    t.text "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["consultation_id"], name: "index_comments_on_consultation_id"
    t.index ["end_user_id"], name: "index_comments_on_end_user_id"
  end

  create_table "consultations", force: :cascade do |t|
    t.integer "end_user_id"
    t.string "title", default: "", null: false
    t.text "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["end_user_id"], name: "index_consultations_on_end_user_id"
  end

  create_table "deposit_balances", force: :cascade do |t|
    t.integer "end_user_id"
    t.integer "savings_estination_id"
    t.integer "savings_amount", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deposit_date"
    t.index ["end_user_id"], name: "index_deposit_balances_on_end_user_id"
    t.index ["savings_estination_id"], name: "index_deposit_balances_on_savings_estination_id"
  end

  create_table "details", force: :cascade do |t|
    t.integer "subject_id"
    t.string "detail_name", null: false
    t.integer "tax_rate", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_details_on_subject_id"
  end

  create_table "end_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name_kana", default: "", null: false
    t.string "first_name_kana", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.boolean "is_deleted", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_end_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_end_users_on_reset_password_token", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "end_user_id"
    t.integer "consultation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["consultation_id"], name: "index_favorites_on_consultation_id"
    t.index ["end_user_id"], name: "index_favorites_on_end_user_id"
  end

  create_table "middle_of_tags", force: :cascade do |t|
    t.integer "consultation_id"
    t.integer "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["consultation_id"], name: "index_middle_of_tags_on_consultation_id"
    t.index ["tag_id"], name: "index_middle_of_tags_on_tag_id"
  end

  create_table "savings_estinations", force: :cascade do |t|
    t.integer "end_user_id"
    t.string "savings_estination_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["end_user_id"], name: "index_savings_estinations_on_end_user_id"
  end

  create_table "source_of_incomes", force: :cascade do |t|
    t.integer "end_user_id"
    t.string "source_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["end_user_id"], name: "index_source_of_incomes_on_end_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subject_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "account_books", "end_users"
  add_foreign_key "account_books", "source_of_incomes"
  add_foreign_key "bop_details", "bop_subjects"
  add_foreign_key "bop_subjects", "end_users"
  add_foreign_key "comments", "consultations"
  add_foreign_key "comments", "end_users"
  add_foreign_key "consultations", "end_users"
  add_foreign_key "deposit_balances", "end_users"
  add_foreign_key "deposit_balances", "savings_estinations"
  add_foreign_key "details", "subjects"
  add_foreign_key "favorites", "consultations"
  add_foreign_key "favorites", "end_users"
  add_foreign_key "middle_of_tags", "consultations"
  add_foreign_key "middle_of_tags", "tags"
  add_foreign_key "savings_estinations", "end_users"
  add_foreign_key "source_of_incomes", "end_users"
end
