class RepertoireSerializer < BaseSerializer
	attribute :laboratory_test
	has_one :laboratory, through: :laboratory_test
end