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

ActiveRecord::Schema.define(version: 20150214145535) do

  create_table "option_types", force: :cascade do |t|
    t.string   "name",         limit: 100
    t.string   "presentation", limit: 100
    t.integer  "position",                 default: 0, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "option_types", ["position"], name: "index_option_types_on_position"

  create_table "option_types_prototypes", id: false, force: :cascade do |t|
    t.integer "prototype_id"
    t.integer "option_type_id"
  end

  add_index "option_types_prototypes", ["option_type_id"], name: "index_option_types_prototypes_on_option_type_id"
  add_index "option_types_prototypes", ["prototype_id"], name: "index_option_types_prototypes_on_prototype_id"

  create_table "option_values", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.string   "presentation"
    t.integer  "option_type_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "option_values", ["option_type_id"], name: "index_option_values_on_option_type_id"
  add_index "option_values", ["position"], name: "index_option_values_on_position"

  create_table "option_values_variants", id: false, force: :cascade do |t|
    t.integer "variant_id"
    t.integer "option_value_id"
  end

  add_index "option_values_variants", ["variant_id", "option_value_id"], name: "index_option_values_variants_on_variant_id_and_option_value_id"
  add_index "option_values_variants", ["variant_id"], name: "index_option_values_variants_on_variant_id"

  create_table "product_option_types", force: :cascade do |t|
    t.integer  "option_type_id"
    t.integer  "product_id"
    t.integer  "position"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "product_option_types", ["option_type_id"], name: "index_product_option_types_on_option_type_id"
  add_index "product_option_types", ["position"], name: "index_product_option_types_on_position"
  add_index "product_option_types", ["product_id"], name: "index_product_option_types_on_product_id"

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
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.boolean  "promotionable",    default: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "products", ["available_on"], name: "index_products_on_available_on"
  add_index "products", ["deleted_at"], name: "index_products_on_deleted_at"
  add_index "products", ["name"], name: "index_products_on_name"

  create_table "products_taxons", force: :cascade do |t|
    t.integer "product_id"
    t.integer "taxon_id"
    t.integer "position",   default: 0
  end

  add_index "products_taxons", ["position"], name: "index_products_taxons_on_position"
  add_index "products_taxons", ["product_id"], name: "index_products_taxons_on_product_id"
  add_index "products_taxons", ["taxon_id"], name: "index_products_taxons_on_taxon_id"

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.string   "presentation", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "properties_prototypes", id: false, force: :cascade do |t|
    t.integer "prototype_id"
    t.integer "property_id"
  end

  add_index "properties_prototypes", ["property_id"], name: "index_properties_prototypes_on_property_id"
  add_index "properties_prototypes", ["prototype_id"], name: "index_properties_prototypes_on_prototype_id"

  create_table "prototypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxonomies", force: :cascade do |t|
    t.string   "name",                   null: false
    t.integer  "position",   default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "taxonomies", ["position"], name: "index_taxonomies_on_position"

  create_table "taxons", force: :cascade do |t|
    t.string   "name",                         null: false
    t.string   "meta_title"
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.text     "description"
    t.integer  "position",         default: 0
    t.integer  "taxonomy_id"
    t.integer  "parent_id"
    t.integer  "lft",                          null: false
    t.integer  "rgt",                          null: false
    t.integer  "depth",                        null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "taxons", ["lft"], name: "index_taxons_on_lft"
  add_index "taxons", ["parent_id"], name: "index_taxons_on_parent_id"
  add_index "taxons", ["position"], name: "index_taxons_on_position"
  add_index "taxons", ["rgt"], name: "index_taxons_on_rgt"
  add_index "taxons", ["taxonomy_id"], name: "index_taxons_on_taxonomy_id"

  create_table "taxons_prototypes", id: false, force: :cascade do |t|
    t.integer "taxon_id"
    t.integer "prototype_id"
  end

  add_index "taxons_prototypes", ["prototype_id"], name: "index_taxons_prototypes_on_prototype_id"
  add_index "taxons_prototypes", ["taxon_id"], name: "index_taxons_prototypes_on_taxon_id"

  create_table "variants", force: :cascade do |t|
    t.string   "sku",                                 default: "",    null: false
    t.datetime "deleted_at"
    t.boolean  "is_master",                           default: false
    t.decimal  "cost_price", precision: 10, scale: 2
    t.integer  "position"
    t.integer  "product_id"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "variants", ["deleted_at"], name: "index_variants_on_deleted_at"
  add_index "variants", ["is_master"], name: "index_variants_on_is_master"
  add_index "variants", ["position"], name: "index_variants_on_position"
  add_index "variants", ["product_id"], name: "index_variants_on_product_id"
  add_index "variants", ["sku"], name: "index_variants_on_sku"

end
