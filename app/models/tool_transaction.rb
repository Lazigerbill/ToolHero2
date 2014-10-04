class ToolTransaction < ActiveRecord::Base

	belongs_to :user
	belongs_to :Tool
	belongs_to :employee
end
