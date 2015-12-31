class CreateLaboratories < ActiveRecord::Migration
  def change
    create_table :laboratories do |t|
      t.string :laboratory_name
      t.string :cpa_status
      t.string :cpa_reference_number
      t.string :contact_name
      t.string :laboratory_name
      t.date :date_completed
      t.boolean :selection_form_completed
      t.boolean :website_updated
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :city
      t.string :postcode
      t.string :telephone
      t.string :website
      t.string :comments
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
