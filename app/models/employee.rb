class Employee < ActiveRecord::Base
	belongs_to :company
	has_many :tools, through: :issuances
	has_many :issuances
end
