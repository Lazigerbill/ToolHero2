class Employee < ActiveRecord::Base
	include PgSearch
  pg_search_scope :search_including_tags, 
    :against => [:first_name, :last_name, :barcode]

	belongs_to :company
	has_many :tools, through: :issuances
	has_many :issuances

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	
	def self.import(file)
  		CSV.foreach(file.path, headers: true) do |row|
        employee = Employee.find_or_create_by(:barcode => row["barcode"])
        row.to_hash.each do |key, value|
          if employee.has_attribute?(key)
            employee.send("#{key}=", value)
          end
        end
        employee.save!
  		end 
  	end 

end
