class Issuance < ActiveRecord::Base
	belongs_to :employee
	belongs_to :tool
	belongs_to :user
end
