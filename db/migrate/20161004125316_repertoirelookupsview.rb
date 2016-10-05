class Repertoirelookupsview < ActiveRecord::Migration
	def change
		create_view :repertoire_lookups, "select repertoires.id as repertoire_id, repertoires.laboratory_test_id, repertoires.laboratory_id as host_laboratory_id, laboratories.id as referral_laboratory_id 
		from repertoires, laboratory_tests, laboratories
		where repertoires.laboratory_test_id = laboratory_tests.id and laboratory_tests.laboratory_id = laboratories.id", force: true
	end
end
