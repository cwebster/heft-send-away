class Addcompletetocontact < ActiveRecord::Migration
  def change
    add_column :laboratory_tests, :ukas_reference_number, :string
  end
end
