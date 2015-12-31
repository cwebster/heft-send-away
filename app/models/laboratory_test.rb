class LaboratoryTest < ActiveRecord::Base
	include Import
	belongs_to :laboratory

end
