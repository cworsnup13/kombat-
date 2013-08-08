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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130731164151) do

  create_table "Players", :force => true do |t|
    t.string   "name"
    t.integer  "skill",           :default => 1
    t.string   "email"
    t.string   "avatar",          :default => "http://localhost:3000/assets/default_avatar.png"
    t.integer  "pin"
    t.integer  "cumulative_wins", :default => 0
    t.integer  "total_games",     :default => 0
    t.integer  "current_score",   :default => 0
    t.datetime "created_at",                                                                     :null => false
    t.datetime "updated_at",                                                                     :null => false
  end

  create_table "games", :force => true do |t|
    t.string   "players1"
    t.string   "player2"
    t.string   "score1"
    t.string   "score2"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
