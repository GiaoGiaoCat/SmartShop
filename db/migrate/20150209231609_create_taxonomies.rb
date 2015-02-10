class CreateTaxonomies < ActiveRecord::Migration
  def change
    create_table :taxonomies do |t|
      t.string :name, null: false
      t.integer :position, default: 0, index: true

      t.timestamps null: false
    end
  end
end
