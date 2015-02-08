class CreateProductProperties < ActiveRecord::Migration
  def change
    create_table :product_properties do |t|
      t.string      :value
      t.references  :product, index: true
      t.references  :property, index: true
      t.integer     :position, default: 0, index: true

      t.timestamps null: false
    end
  end
end
