class LabTestUpdated < ActiveRecord::Migration
  def change
    add_column :laboratory_tests, :date_test_information_updated, :date
  end
end
