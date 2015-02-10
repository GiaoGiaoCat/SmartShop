class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string   :name, default: "", null: false, index: true
      t.text     :description
      t.datetime :available_on, index: true
      t.datetime :deleted_at, index: true
      t.string   :meta_title
      t.string   :meta_keywords
      t.text     :meta_description
      # t.integer  :tax_category_id
      # t.integer  :shipping_category_id
      # t.string   :slug
      t.boolean  :promotionable, default: true
      # maybe remove to a model
      # t.text     :detail

      t.timestamps null: false
    end

    # add_index :products, :slug, unique: true
    # add_index :products, :shipping_category_id, unique: true
    # add_index :products, :tax_category_id, unique: true
  end
end
