class CreateOptionValuesVariants < ActiveRecord::Migration
  def change
    create_table :option_values_variants, id: false do |t|
      t.references :variant, index: true
      t.references :option_value
    end

    add_index :option_values_variants, [:variant_id, :option_value_id]
  end
end

