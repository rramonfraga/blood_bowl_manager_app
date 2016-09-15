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

ActiveRecord::Schema.define(version: 20151210173534) do

  create_table "aptitudes", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_aptitudes_on_player_id"
    t.index ["skill_id"], name: "index_aptitudes_on_skill_id"
  end

  create_table "championships", force: :cascade do |t|
    t.string   "name"
    t.integer  "community_id"
    t.string   "kind",          default: "League"
    t.integer  "init_treasury", default: 1000000
    t.boolean  "start",         default: false
    t.boolean  "finish",        default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["community_id"], name: "index_championships_on_community_id"
  end

  create_table "communities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feats", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "player_id"
    t.string   "kind"
    t.string   "casuality"
    t.boolean  "host_team",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["match_id"], name: "index_feats_on_match_id"
    t.index ["player_id"], name: "index_feats_on_player_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "season_id"
    t.integer  "host_team_id"
    t.integer  "visit_team_id"
    t.boolean  "finish",        default: false
    t.integer  "host_result",   default: 0
    t.integer  "visit_result",  default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["season_id"], name: "index_matches_on_season_id"
  end

  create_table "participations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "community_id"
    t.boolean  "admin",        default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["community_id"], name: "index_participations_on_community_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer  "team_id"
    t.string   "title"
    t.string   "name"
    t.integer  "player_id"
    t.integer  "dorsal"
    t.integer  "cost"
    t.integer  "experience", default: 0
    t.string   "level",      default: "Rookie"
    t.boolean  "level_up",   default: false
    t.integer  "dice_roll"
    t.integer  "mvp"
    t.integer  "ma"
    t.integer  "st"
    t.integer  "ag"
    t.integer  "av"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["player_id"], name: "index_players_on_player_id"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "championship_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["championship_id"], name: "index_registrations_on_championship_id"
    t.index ["team_id"], name: "index_registrations_on_team_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer  "championship_id"
    t.integer  "round"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["championship_id"], name: "index_seasons_on_championship_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "team_id"
    t.integer  "treasury",          default: 1000000
    t.integer  "value"
    t.integer  "re_rolls"
    t.integer  "fan_factor"
    t.integer  "assistant_coaches"
    t.integer  "cheerleaders"
    t.integer  "apothecaries"
    t.integer  "halfling_chef"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["team_id"], name: "index_teams_on_team_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "templates_ability", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_templates_ability_on_player_id"
    t.index ["skill_id"], name: "index_templates_ability_on_skill_id"
  end

  create_table "templates_player", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_templates_player_on_team_id"
  end

  create_table "templates_skill", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "templates_team", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "reroll_value"
    t.boolean  "apothecary"
    t.boolean  "stakes"
    t.string   "revive"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "username"
    t.boolean  "admin",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
