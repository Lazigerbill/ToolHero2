class Tool < ActiveRecord::Base

	belongs_to :company
  has_many :issuances
  belongs_to :inventory_type

	acts_as_taggable

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


	def quantity_on_hand
  		outstanding_issuances = issuances.where("returned_at is null")
  		issuance_total = outstanding_issuances.map{ |issuance| issuance.quantity }.sum
  		quantity - issuance_total
  	end

  	def self.import(file)
  		CSV.foreach(file.path, headers: true) do |row|
        tool = Tool.find_or_create_by(:barcode => row["barcode"])
        row.to_hash.each do |key, value|
          if tool.has_attribute?(key)
            tool.send("#{key}=", value)
          end
        end
        tool.save!
  		end 
  	end 

end
