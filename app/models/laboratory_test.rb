class LaboratoryTest < ActiveRecord::Base
	include Import
	include AlgoliaSearch
	belongs_to :laboratory

	algoliasearch do
		attribute :analyte_name
	end

end
