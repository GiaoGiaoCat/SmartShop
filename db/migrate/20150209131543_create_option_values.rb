class CreateOptionValues < ActiveRecord::Migration
  def change
    create_table :option_values do |t|
      t.string      :name
      t.integer     :position, index: true
      t.string      :presentation
      t.references  :option_type, index: true
      t.timestamps null: false
    end
  end
end
