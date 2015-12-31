ActiveAdmin.register LaboratoryTest do

	permit_params :id, :analyte_name, :comments, :eqa_status, :turnaround_time,
	:ukas_status, :methodology, :reference_range, :sample_type,
	:cost_of_test, :uncertainty_of_measurement, :laboratory_id

	active_admin_import_anything do |file|
		LaboratoryTest.import_csv(file)
	end

end
