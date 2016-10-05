class Addemailtolaboratorytest < ActiveRecord::Migration
  def change
  	add_column :laboratory_tests, :email, :string
  end
end
