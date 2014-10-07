class Tool < ActiveRecord::Base

	acts_as_taggable

	has_many :issuances
	belongs_to :company
	belongs_to :employee
	has_one :inventory_type

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/no-image-available.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  validates :quantity, :presence => true

  	# before_save :set_issue_type

	def quantity_on_hand
  		outstanding_issuances = issuances.where("returned_at is null")
  		issuance_total = outstanding_issuances.map{ |issuance| issuance.quantity }.sum
  		(quantity || 0) - (issuance_total || 0)
  	end

  	# def set_issue_type
  	# 	case self.inventory_type_id
  	# 	when 1
  	# 		self.issue_type_id = 1
  	# 	when 2
  	# 		self.issue_type_id = 2
  	# 	when 3
  	# 		self.issue_type_id = 1
  	# 	end
  	# end

end
