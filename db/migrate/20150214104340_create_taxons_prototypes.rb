class CreateTaxonsPrototypes < ActiveRecord::Migration
  def change
    create_table :taxons_prototypes, id: false do |t|
      t.references :taxon, index: true
      t.references :prototype, index: true
    end
  end
end
