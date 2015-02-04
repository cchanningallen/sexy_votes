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

ActiveRecord::Schema.define(version: 20150123045235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "issues", force: true do |t|
    t.text     "name"
    t.text     "type"
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "issues", ["team_id"], name: "index_issues_on_team_id", using: :btree
  add_index "issues", ["user_id"], name: "index_issues_on_user_id", using: :btree

  create_table "organizations", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_memberships", ["team_id"], name: "index_team_memberships_on_team_id", using: :btree
  add_index "team_memberships", ["user_id"], name: "index_team_memberships_on_user_id", using: :btree

  create_table "teams", force: true do |t|
    t.text     "name"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["organization_id"], name: "index_teams_on_organization_id", using: :btree

  create_table "users", force: true do |t|
    t.text     "name"
    t.text     "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.text     "score"
    t.integer  "user_id"
    t.integer  "issue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["issue_id"], name: "index_votes_on_issue_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
