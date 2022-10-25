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

ActiveRecord::Schema[7.0].define(version: 2022_10_24_112733) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitions", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.bigint "team_category_id", null: false
    t.bigint "scoring_system_id", null: false
    t.boolean "public", default: false
    t.boolean "active", default: true
    t.boolean "prizes", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scoring_system_id"], name: "index_competitions_on_scoring_system_id"
    t.index ["team_category_id"], name: "index_competitions_on_team_category_id"
    t.index ["user_id"], name: "index_competitions_on_user_id"
  end

  create_table "fixtures", force: :cascade do |t|
    t.bigint "home_team_id", null: false
    t.bigint "away_team_id", null: false
    t.date "date"
    t.bigint "competition_id", null: false
    t.integer "home_score"
    t.integer "away_score"
    t.boolean "locked", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_team_id"], name: "index_fixtures_on_away_team_id"
    t.index ["competition_id"], name: "index_fixtures_on_competition_id"
    t.index ["home_team_id"], name: "index_fixtures_on_home_team_id"
  end

  create_table "scoring_systems", force: :cascade do |t|
    t.string "name"
    t.integer "range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "team_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_category_id"], name: "index_teams_on_team_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "competitions", "scoring_systems"
  add_foreign_key "competitions", "team_categories"
  add_foreign_key "competitions", "users"
  add_foreign_key "fixtures", "competitions"
  add_foreign_key "fixtures", "teams", column: "away_team_id"
  add_foreign_key "fixtures", "teams", column: "home_team_id"
  add_foreign_key "teams", "team_categories"
end
