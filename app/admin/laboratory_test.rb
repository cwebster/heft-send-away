ActiveAdmin.register LaboratoryTest do

	permit_params :id, :analyte_name, :comments, :eqa_status, :turnaround_time,
	:ukas_status, :methodology, :reference_range, :sample_type,
	:cost_of_test, :uncertainty_of_measurement, :laboratory_id, :lab_number

	active_admin_import_anything do |file|
		LaboratoryTest.import_csv(file)
	end

	action_item do
		link_to 'Links lab codes', link_lab_codes_admin_laboratory_tests_path, method: :post
	end

	collection_action :link_lab_codes, method: :post do
		LaboratoryTest.find_each do |lt|
			# find the lab first
			lab = Laboratory.find_by lab_number: lt.lab_number
			lt.laboratory_id = lab.id
			lt.save
		end
	end

end
