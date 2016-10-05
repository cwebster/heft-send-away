ActiveAdmin.register Repertoire do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

filter :laboratory, :collection => proc {(Laboratory.all).map{|c| [c.laboratory_name, c.id]}}
filter :laboratory_test, :collection => proc {(LaboratoryTest.all).map{|c| [c.analyte_name, c.id]}}


  index do
    selectable_column
    column "Host Laboratory" do |lab|
    	lab.laboratory.laboratory_name

    end
    column :selection_form_completed
    column :record_complete
    column :date_request_for_information_sent
  end

end
