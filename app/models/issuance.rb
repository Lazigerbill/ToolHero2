class Issuance < ActiveRecord::Base

	attr_accessor :barcode

	belongs_to :employee
	belongs_to :tool
	belongs_to :user
	has_many :line_items

	delegate :barcode, :to => :tool, :allow_nil => true

  	before_save :add_tool_by_barcode

  	def add_tool_by_barcode
  		tool = Tool.find_by_barcode(self.barcode)
    	self.tool_id = tool.id
  	end

end
