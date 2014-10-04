class CreateToolTransactions < ActiveRecord::Migration
  def change
    create_table :tool_transactions do |t|
      t.integer :employee_id
      t.integer :tool_id
      t.datetime :issued_at
      t.datetime :due_date
      t.datetime :returned_at
      t.string :outgoing_condition
      t.string :incoming_condition
      t.integer :quantity

      t.timestamps
    end
  end
end
