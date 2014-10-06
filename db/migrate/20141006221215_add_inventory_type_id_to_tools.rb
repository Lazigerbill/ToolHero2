class AddInventoryTypeIdToTools < ActiveRecord::Migration
  def change
    add_column :tools, :inventory_type_id, :integer
  end
end
