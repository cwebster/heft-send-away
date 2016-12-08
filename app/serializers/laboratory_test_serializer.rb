class LaboratoryTestSerializer < BaseSerializer
	attribute :analyte_name
	attribute :eqa_status
	attribute :turnaround_time
	attribute :ukas_status
	attribute :methodology
	attribute :reference_range
	attribute :sample_type
	attribute :cost_of_test
	attribute :uncertainty_of_measurement
	attribute :eqa_provider
	attribute :eqa_performance
	attribute :sample_volume
	attribute :special_collection_requirements
	attribute :ukas_reference_number
	attribute :date_test_information_updated
	has_one :laboratory
end