class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.string :email
      t.string :telephone
      t.string :contact_person

      t.timestamps
    end
  end
end
