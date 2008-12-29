# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081229115125) do

  create_table "city_global_locations", :force => true do |t|
    t.string   "country"
    t.string   "city"
    t.string   "accent_city"
    t.integer  "population"
    t.decimal  "latitude",    :precision => 12, :scale => 9, :default => 0.0
    t.decimal  "longitude",   :precision => 12, :scale => 9, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "country_codes", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "us_state_codes", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
