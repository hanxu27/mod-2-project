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

ActiveRecord::Schema.define(version: 2019_05_26_014613) do

  create_table "coaches", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.boolean "admin"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_coaches_on_team_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "coachability"
    t.integer "athleticism"
    t.integer "passing"
    t.integer "serve"
    t.integer "sr"
    t.integer "setting"
    t.integer "hitting"
    t.integer "communication"
    t.integer "vball_iq"
    t.string "team"
    t.text "comments"
    t.boolean "flag"
    t.integer "tryout_id"
    t.integer "coach_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_evaluations_on_coach_id"
    t.index ["tryout_id"], name: "index_evaluations_on_tryout_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "birthday"
    t.integer "height"
    t.string "hand"
    t.string "school"
    t.string "parent_name"
    t.string "parent_number"
    t.string "parent_address"
    t.string "position_1"
    t.string "position_2"
    t.text "playing_experience"
    t.text "additional_comments"
    t.string "img_path"
    t.integer "team_id"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "age_group"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tryouts", force: :cascade do |t|
    t.integer "season"
    t.boolean "forms_completed"
    t.boolean "paid"
    t.integer "reach"
    t.integer "approach_jump"
    t.integer "block_jump"
    t.float "point_touch"
    t.float "dash"
    t.integer "age_group"
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_tryouts_on_player_id"
  end

end
