class LaboratoryTestPolicy
	attr_reader :user, :record

	def initialize(user, laboratory_test)
		@user = user
		@laboratory_test = laboratory_test
	end

	def index?
		user.admin? or @laboratory_test.first.user_id == user
	end

	def edit?
    user.admin? or @laboratory_test.laboratory.user_id == user
	end

	def update?
		user.admin? or @laboratory_test.laboratory.user_id == user
	end

	def show?
		user.admin? or @laboratory_test.laboratory.user_id == user
	end

end
