class Company < ActiveRecord::Base
	has_many :users
	has_many :tools
	has_many :employees
end
