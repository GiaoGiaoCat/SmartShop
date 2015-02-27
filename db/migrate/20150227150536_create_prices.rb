class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.references  :variant, null: false
      t.decimal     :amount, precision: 10, scale: 2
      t.string      :type
      t.datetime    :deleted_at, index: true

      t.timestamps null: false
    end

    add_index :prices, [:variant_id, :type]
  end
end



