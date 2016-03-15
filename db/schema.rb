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

ActiveRecord::Schema.define(version: 20160314165333) do

  create_table "animal_enclosures", force: :cascade do |t|
    t.integer "animal_id"
    t.integer "enclosure_id"
  end

  add_index "animal_enclosures", ["animal_id"], name: "index_animal_enclosures_on_animal_id"
  add_index "animal_enclosures", ["enclosure_id"], name: "index_animal_enclosures_on_enclosure_id"

  create_table "animals", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "specie_id"
  end

  add_index "animals", ["name"], name: "index_animals_on_name"
  add_index "animals", ["specie_id"], name: "index_animals_on_specie_id"

  create_table "enclosures", force: :cascade do |t|
    t.integer  "enclosure_number"
    t.string   "enclosure_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "enclosures", ["enclosure_number"], name: "index_enclosures_on_enclosure_number"

  create_table "species", force: :cascade do |t|
    t.string   "latin_name"
    t.string   "canonical_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "species", ["canonical_name"], name: "index_species_on_canonical_name"
  add_index "species", ["latin_name"], name: "index_species_on_latin_name"

end
