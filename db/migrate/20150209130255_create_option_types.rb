class CreateOptionTypes < ActiveRecord::Migration
  def change
    create_table :option_types do |t|
      t.string  :name, limit: 100
      t.string  :presentation, limit: 100
      t.integer :position, default: 0, null: false, index: true

      t.timestamps null: false
    end
  end
end
