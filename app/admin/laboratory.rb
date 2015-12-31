ActiveAdmin.register Laboratory do

	# See permitted parameters documentation:
	# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
	#
	# permit_params :list, :of, :attributes, :on, :model
	#
	# or
	#
permit_params :laboratory_name, :cpa_status, :cpa_reference_number, :contact_name,
		             :date_completed, :selection_form_completed, :website_updated,
							   :address1, :address2, :address3, :city, :postcode, :telephone,
							   :website, :comments, :id

	active_admin_import_anything do |file|
		Laboratory.import_csv(file)
	end

end
