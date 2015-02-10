class CreateTaxons < ActiveRecord::Migration
  def change
    create_table :taxons do |t|
      t.string      :name, null: false
      # t.string :permalink, index: true
      t.string      :meta_title
      t.string      :meta_keywords
      t.text        :meta_description
      t.text        :description
      t.integer     :position, default: 0, index: true
      t.references  :taxonomy, index: true

      t.integer     :parent_id, index: true
      # REVIEW: spree set lft and rgt could be null.
      t.integer     :lft, null: false, index: true
      t.integer     :rgt, null: false, index: true
      t.integer     :depth, null: false

      t.timestamps null: false
    end
  end
end
