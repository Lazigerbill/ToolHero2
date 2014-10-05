class Tool < ActiveRecord::Base

	has_many :tool_transactions
	belongs_to :manufacturer

	acts_as_taggable

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


	def quantity_on_hand
		outstanding_tool_transaction = tool_transactions.where("returned_at is null")
		tool_transactions_total = outstanding_tool_transaction.map { |transaction| transaction.quantity }.sum
		quantity - tool_transactions_total
	end
end
