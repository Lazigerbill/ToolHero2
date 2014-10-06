class Tool < ActiveRecord::Base

	has_many :issuances
	belongs_to :manufacturer

	acts_as_taggable

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


	def quantity_on_hand
  		outstanding_issuances = issuances.where("returned_at is null")
  		issuance_total = outstanding_issuances.map{ |issuance| issuance.quantity }.sum
  		quantity - issuance_total
  	end
end
