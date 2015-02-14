class CreateOptionTypesPrototypes < ActiveRecord::Migration
  def change
    create_table :option_types_prototypes, id: false do |t|
      t.references :prototype, index: true
      t.references :option_type, index: true
    end
  end
end
