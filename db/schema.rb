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

ActiveRecord::Schema.define(version: 20151210094946) do

  create_table "abilities", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "abilities", ["player_id"], name: "index_abilities_on_player_id"
  add_index "abilities", ["skill_id"], name: "index_abilities_on_skill_id"

  create_table "championships", force: :cascade do |t|
    t.string   "name"
    t.integer  "society_id"
    t.string   "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "start"
  end

  add_index "championships", ["society_id"], name: "index_championships_on_society_id"

  create_table "matches", force: :cascade do |t|
    t.integer  "season_id"
    t.integer  "host_team_id"
    t.integer  "visit_team_id"
    t.boolean  "finished"
    t.integer  "host_result"
    t.integer  "visit_result"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "matches", ["season_id"], name: "index_matches_on_season_id"

  create_table "participations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "society_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "participations", ["society_id"], name: "index_participations_on_society_id"
  add_index "participations", ["user_id"], name: "index_participations_on_user_id"

  create_table "players", force: :cascade do |t|
    t.integer  "quantity"
    t.string   "title"
    t.integer  "team_id"
    t.integer  "cost"
    t.integer  "ma"
    t.integer  "st"
    t.integer  "ag"
    t.integer  "av"
    t.string   "normal"
    t.string   "double"
    t.boolean  "feeder"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "list_skills"
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id"

  create_table "registrations", force: :cascade do |t|
    t.integer  "user_team_id"
    t.integer  "championship_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "registrations", ["championship_id"], name: "index_registrations_on_championship_id"
  add_index "registrations", ["user_team_id"], name: "index_registrations_on_user_team_id"

  create_table "seasons", force: :cascade do |t|
    t.integer  "championship_id"
    t.integer  "round"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "seasons", ["championship_id"], name: "index_seasons_on_championship_id"

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "societies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "reroll_value"
    t.boolean  "apothecary"
    t.boolean  "stakes"
    t.string   "revive"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "user_players", force: :cascade do |t|
    t.integer  "user_team_id"
    t.string   "user_name"
    t.integer  "template_player_id"
    t.integer  "dorsal_number"
    t.integer  "player_value"
    t.integer  "injury"
    t.integer  "complentions"
    t.integer  "touchdowns"
    t.integer  "interceptions"
    t.integer  "casualties"
    t.integer  "mvp"
    t.integer  "ma"
    t.integer  "st"
    t.integer  "ag"
    t.integer  "av"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "list_skills"
    t.string   "title"
  end

  add_index "user_players", ["user_team_id"], name: "index_user_players_on_user_team_id"

  create_table "user_teams", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "user_name"
    t.integer  "template_team_id"
    t.integer  "treasury"
    t.integer  "team_value"
    t.integer  "re_rolls"
    t.integer  "fan_factor"
    t.integer  "assistant_coaches"
    t.integer  "cheerleaders"
    t.integer  "apothecaries"
    t.integer  "halfling_chef"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.boolean  "active"
  end

  add_index "user_teams", ["user_id"], name: "index_user_teams_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
