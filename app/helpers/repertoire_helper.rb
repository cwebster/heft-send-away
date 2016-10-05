module RepertoireHelper

	def laboratory_details(key)
		x = Laboratory.find(key)
		"#{x.laboratory_name} #{x.address1}"
	end

	def investigations_for_laboratory(key, laboratory)
		dataset = RepertoireLookup.where(referral_laboratory_id: key, host_laboratory_id: laboratory)
		response = ''
		dataset.each do |lookup|
        response = response + "#{link_to lookup.laboratory_test.analyte_name, edit_repertoire_path(lookup.repertoire.id)}<br>"

		end
		return response.html_safe
	end
end
