class AddLabNumberLabTests < ActiveRecord::Migration
  def change
    add_column :laboratory_tests, :lab_number, :string
    add_column :laboratory_tests, :eqa_provider, :string
    add_column :laboratory_tests, :eqa_performance, :string
    add_column :laboratory_tests, :sample_volume, :string
    add_column :laboratory_tests, :special_collection_requirements, :string
  end
end
