class Issuance < ActiveRecord::Base

	attr_accessor :incoming_tool_barcode
	attr_accessor :incoming_employee_barcode

	belongs_to :employee
	belongs_to :tool
	belongs_to :user
	has_many :line_items

	delegate :barcode, :to => :tool, :prefix => true, :allow_nil => true
	delegate :barcode, :to => :employee, :prefix => true, :allow_nil => true

  	before_save :add_tool_by_barcode
  	before_save :add_employee_by_barcode

  	def add_tool_by_barcode
  		tool = Tool.find_by_barcode(self.incoming_tool_barcode)
    	unless tool.blank?
    		self.tool_id = tool.id
    	end
  	end

  	def add_employee_by_barcode
  		employee = Employee.find_by_barcode(self.incoming_employee_barcode)
    	binding.pry
      self.employee_id = employee.id
  	end

end
