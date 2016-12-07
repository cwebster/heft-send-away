class LaboratorySerializer < BaseSerializer
	has_many :laboratory_tests
	attribute :laboratory_name
	attribute :city
	attribute :address1
	attribute :address2
	attribute :address3
	attribute :cpa_status
	attribute :contact_name
	attribute :postcode
	attribute :telephone
	attribute :website
	attribute :cpa_reference_number
	attribute :date_selection_form_completed
	attribute :date_selection_form_completed
	attribute :website_updated
	attribute :date_request_for_information_sent
	attribute :date_information_updated
	attribute :email
end
