class RepertoireOneLaboratoryTest < ActiveRecord::Migration
  def change
    rename_column :repertoires, :laboratory_tests_id, :laboratory_test_id
  end
end
