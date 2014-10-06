class Employee < ActiveRecord::Base
	
	belongs_to :company
	has_many :tools, through: :issuances

	acts_as_taggable
end
