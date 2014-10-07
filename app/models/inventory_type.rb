class InventoryType < ActiveRecord::Base
	has_many :tools
end
