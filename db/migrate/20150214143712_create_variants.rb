class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.string      :sku, default: '', null: false, index: true
      t.datetime    :deleted_at, index: true
      t.boolean     :is_master, default: false, index: true
      t.decimal     :cost_price, precision: 10, scale: 2
      t.integer     :position, index: true
      t.references  :product, index: true
      # t.boolean   :track_inventory, default: true, index: true
      # t.integer   :tax_category_id, index: true
      # t.integer   :stock_items_count, default: 0, null: false

      t.timestamps null: false
    end
  end
end
