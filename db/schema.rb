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

ActiveRecord::Schema.define(version: 20150208141842) do

  create_table "product_properties", force: :cascade do |t|
    t.string   "value"
    t.integer  "product_id"
    t.integer  "property_id"
    t.integer  "position",    default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "product_properties", ["position"], name: "index_product_properties_on_position"
  add_index "product_properties", ["product_id"], name: "index_product_properties_on_product_id"
  add_index "product_properties", ["property_id"], name: "index_product_properties_on_property_id"

  create_table "products", force: :cascade do |t|
    t.string   "name",             default: "",   null: false
    t.text     "description"
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.string   "meta_title"
    t.text     "meta_description"
    t.string   "meta_keywords"
    t.boolean  "promotionable",    default: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "products", ["available_on"], name: "index_products_on_available_on"
  add_index "products", ["deleted_at"], name: "index_products_on_deleted_at"
  add_index "products", ["name"], name: "index_products_on_name"

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.string   "presentation", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
