class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.integer :barcode
      t.text :description
      t.string :model_number
      t.integer :quantity
      t.datetime :warranty_end
      t.datetime :calibration_end
      t.text :notes

      t.timestamps
    end
  end
end
