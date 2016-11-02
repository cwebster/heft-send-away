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
end
