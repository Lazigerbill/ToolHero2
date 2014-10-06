class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :tools_id
      t.datetime :issued_at
      t.datetime :due_date
      t.integer :quantity
      t.string :outgoing_condition

      t.timestamps
    end
  end
end
