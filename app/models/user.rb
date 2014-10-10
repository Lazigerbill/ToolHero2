class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  

  before_create :create_associated_records


  belongs_to :company
  has_many :issuances
  has_many :tools, through: :issuances
  


  private

  def create_associated_records
    return unless self.company_id.nil?
    self.create_company
  end

end

