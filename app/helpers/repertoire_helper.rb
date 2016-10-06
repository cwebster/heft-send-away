module RepertoireHelper

	def laboratory_details(key)
		if key.class == Fixnum
		  x = Laboratory.find(key)
		else
		  x = Laboratory.find(key[:laboratory_id])
		end
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

	def repertoire_record_complete(repertoire)
		if repertoire.record_complete
			return "<i class='fa fa-check'></i>".html_safe
		else
			return "<i class='fa fa-times'></i>".html_safe
		end
	end

	def repertoire_selection_form_complete(repertoire)
		if repertoire.selection_form_completed
			return "<i class='fa fa-check'></i>".html_safe
		else
			return "<i class='fa fa-times'></i>".html_safe
		end
	end

	def repertoire_website_updated(repertoire)
		if repertoire.website_updated
			return "<i class='fa fa-check'></i>".html_safe
		else
			return "<i class='fa fa-times'></i>".html_safe
		end
	end

	def repertoire_test_details(laboratory:, repertoires:)
		response = ''
		LaboratoryTest.where(laboratory_id: laboratory).where(id: repertoires.pluck(:laboratory_test_id)).each do |investigation|
			rep = repertoires.where(laboratory_test_id:investigation.id).first 
			response = response + "#{link_to investigation.analyte_name, edit_repertoire_path(rep)}<br>"
			response = response + "<td>#{rep.date_information_updated}</td><td>#{rep.date_request_for_information_sent}</td></tr>"
			response = response + "<tr><td></td><td>"
		end
		return response.html_safe
	end
end
