module LaboratoryTestHelper
	def test_in_repertoire?(laboratory_id:, laboratory_test:)
		response = ''

		if Repertoire.in_repertoire?(laboratory_id: laboratory_id ,laboratory_test_id: laboratory_test)
			response = response + "<a href='#{edit_laboratory_test_path(laboratory_test)}' class='btn btn-outline btn-danger'><i class='fa fa-edit'></i></a>".html_safe
		else
			response = "Not in repertoire"
		end

		return response.html_safe
 
	end
end
