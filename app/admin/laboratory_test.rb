ActiveAdmin.register LaboratoryTest do
  permit_params :id, :analyte_name, :comments, :eqa_status, :turnaround_time,
                :ukas_status, :methodology, :reference_range, :sample_type,
                :cost_of_test, :uncertainty_of_measurement, :laboratory_id, :lab_number

filter :laboratory, :collection => proc {(Laboratory.all).map{|c| [c.laboratory_name, c.id]}}
filter :analyte_name

index do
  selectable_column
  column :analyte_name
  column "Laboratory" do |laboratory_test|
    link_to laboratory_test.laboratory.laboratory_name, admin_laboratory_path(laboratory_test.laboratory)
  end
end


form do |f|
  f.inputs "Test Details" do
    f.input :laboratory_id, :label => 'Laboratory', :as => :select, :collection => Laboratory.all.map{|u| ["#{u.laboratory_name}, #{u.address1}", u.id]}
    f.input :analyte_name
    f.input :comments
    f.input :eqa_status
    f.input :turnaround_time
    f.input :ukas_status
    f.input :methodology
    f.input :reference_range
    f.input :sample_type
    f.input :cost_of_test
    f.input :uncertainty_of_measurement
  end
end


  active_admin_import_anything do |file|
    LaboratoryTest.import_laboratory_tests(file)
  end

  action_item do
    link_to 'Links lab codes', link_lab_codes_admin_laboratory_tests_path, method: :post
  end

  collection_action :link_lab_codes, method: :post do
    LaboratoryTest.find_each do |lt|
      # find the lab first
      lab = Laboratory.find_by lab_number: lt.lab_number
      unless lab.nil?
        lt.laboratory_id = lab.id
        lt.save
      end
    end
  end
end
