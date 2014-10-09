class Issuance < ActiveRecord::Base

	attr_accessor :incoming_tool_barcode
	attr_accessor :incoming_employee_barcode

	belongs_to :employee
	belongs_to :tool
	belongs_to :user
	has_many :line_items

  validate :quantity_on_hand_cannot_be_less_than_zero

	delegate :barcode, :to => :tool, :prefix => true, :allow_nil => true
	delegate :barcode, :to => :employee, :prefix => true, :allow_nil => true

	before_validation :add_tool_by_barcode
	before_save :add_employee_by_barcode

	def add_tool_by_barcode
		tool = Tool.find_by_barcode(self.incoming_tool_barcode)
  	unless tool.blank?
  		self.tool_id = tool.id
  	end
	end

	def add_employee_by_barcode
		employee = Employee.find_by_barcode(self.incoming_employee_barcode)
  	self.employee_id = employee.id
	end

  def quantity_on_hand_cannot_be_less_than_zero
    if tool.quantity_on_hand < 1
      errors.add(:quantity_on_hand, " is #{tool.quantity_on_hand}.")
    end 
  end

  def quantity_is_available
    
  end

end