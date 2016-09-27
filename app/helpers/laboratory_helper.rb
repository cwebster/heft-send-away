module LaboratoryHelper
	def ukas_status_html(status)
		response = ''
		if status.nil?
			response = "Yes/No"
		elsif status == 'Yes'
			response = 'Yes'
		else
			response = 'No'
		end
    return response
	end

	def laboratory_details(laboratory_id:)
		laboratory = Laboratory.find(laboratory_id)
		response = "<b>#{laboratory.laboratory_name}</b><br>#{laboratory.address1}<br>#{laboratory.address2}<br>#{laboratory.address3}</br>#{laboratory.postcode}".html_safe

	end
end
