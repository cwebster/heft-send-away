ActiveAdmin.register Laboratory do

	# See permitted parameters documentation:
	# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
	#
	# permit_params :list, :of, :attributes, :on, :model
	#
	# or
	#
	permit_params :laboratory_name, :cpa_status, :cpa_reference_number, :contact_name,
	:date_selection_form_completed, :selection_form_completed, :website_updated,
	:address1, :address2, :address3, :city, :postcode, :telephone,
	:website, :comments, :id, :date_request_for_information_sent, :date_information_updated

	active_admin_import_anything do |file|
		Laboratory.import_csv(file)
	end


	action_item do
		link_to 'Init updated dates', init_update_date_admin_laboratories_path, method: :post
	end

	collection_action :init_update_date, method: :post do
		Laboratory.update_all("date_information_updated=date_selection_form_completed")
		render 'index'
	end

end
