class RepertoireLookup < ActiveRecord::Base
	belongs_to :laboratory_test
	belongs_to :repertoire
	belongs_to :host_laboratory, class_name: 'Laboratory'
    belongs_to :referral_laboratory, class_name: 'Laboratory'
end