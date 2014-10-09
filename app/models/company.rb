class Company < ActiveRecord::Base
	include PgSearch
  	pg_search_scope :search_including_tags, 
    	:against => [:name]

	has_many :users
	has_many :tools
	has_many :employees
end
