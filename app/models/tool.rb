class Tool < ActiveRecord::Base
  include PgSearch   
  pg_search_scope :search_including_tags, 
    :against => [:description, :barcode],
    :associated_against => {:tags => [:name]}  

  belongs_to :company
  belongs_to :inventory_type
  has_many :issuances

  acts_as_taggable


  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/no-image-available.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  validates :quantity, :presence => true

    # before_save :set_issue_type

  def quantity_on_hand
      outstanding_issuances = issuances.where("returned_at is null")
      issuance_total = outstanding_issuances.map{ |issuance| issuance.quantity }.sum
      (quantity || 0) - (issuance_total || 0)
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
    # def set_issue_type
    #   case self.inventory_type_id
    #   when 1
    #     self.issue_type_id = 1
    #   when 2
    #     self.issue_type_id = 2
    #   when 3
    #     self.issue_type_id = 1
    #   end
    # end


end
