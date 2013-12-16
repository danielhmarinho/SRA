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

ActiveRecord::Schema.define(:version => 20131210171629) do

  create_table "alunos", :force => true do |t|
    t.string   "matricula"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "atendimentos", :force => true do |t|
    t.integer  "pessoa_id"
    t.datetime "data"
    t.integer  "place_id"
    t.integer  "type_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "atendimentos", ["pessoa_id"], :name => "index_atendimentos_on_pessoa_id"
  add_index "atendimentos", ["place_id"], :name => "index_atendimentos_on_place_id"
  add_index "atendimentos", ["type_id"], :name => "index_atendimentos_on_type_id"

  create_table "comunidades", :force => true do |t|
    t.string   "identificacao"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "pessoas", :force => true do |t|
    t.integer  "as_pessoa_id"
    t.string   "as_pessoa_type"
    t.string   "name"
    t.string   "identificacao"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "places", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "places_types", :id => false, :force => true do |t|
    t.integer "place_id"
    t.integer "type_id"
  end

  add_index "places_types", ["place_id", "type_id"], :name => "index_places_types_on_place_id_and_type_id"

  create_table "professors", :force => true do |t|
    t.string   "matricula"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "servidors", :force => true do |t|
    t.string   "matricula"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
