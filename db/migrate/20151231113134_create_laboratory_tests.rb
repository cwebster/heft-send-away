class CreateLaboratoryTests < ActiveRecord::Migration
  def change
    create_table :laboratory_tests do |t|
      t.string :analyte_name
      t.string :comments
      t.string :eqa_status
      t.string :turnaround_time
      t.string :ukas_status
      t.string :methodology
      t.string :reference_range
      t.string :sample_type
      t.string :cost_of_test
      t.string :uncertainty_of_measurement
      t.belongs_to :laboratory

      t.timestamps null: false
    end
  end
end
