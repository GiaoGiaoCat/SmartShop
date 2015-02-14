class CreatePropertiesPrototypes < ActiveRecord::Migration
  def change
    create_table :properties_prototypes, id: false do |t|
      t.references  :prototype, index: true
      t.references  :property, index: true
    end
  end
end
