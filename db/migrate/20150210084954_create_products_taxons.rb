class CreateRoductsTaxons < ActiveRecord::Migration
  def change
    create_table :products_taxons do |t|
      t.references  :product, index: true
      t.references  :taxon, index: true
      t.integer     :position, default: 0, index: true
    end
  end
end
