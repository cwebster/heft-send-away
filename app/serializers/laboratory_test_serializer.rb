class LaboratoryTestSerializer < BaseSerializer
	attribute :analyte_name
	has_one :laboratory
end