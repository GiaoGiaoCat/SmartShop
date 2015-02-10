class CreateRoductsTaxons < ActiveRecord::Migration
  def change
    create_table :roducts_taxons do |t|
      t.references  :product, index: true
      t.references  :taxon, index: true
      t.integer     :position, default: 0, index: true
    end
  end
end
