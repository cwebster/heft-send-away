class LaboratoryPolicy
	attr_reader :user, :record

	def initialize(user, laboratory)
		@user = user
		@laboratory = laboratory
	end

	def index?
		user.admin? or @laboratory.first.user_id == user
	end

	def edit?
		user.admin? or @laboratory.first.user_id == user
	end

	def update?
		user.admin? or @laboratory.first.user_id == user
	end

	def show?
		user.admin? or @laboratory.first.user_id == user
	end

	def labs_out_of_date?
		user.admin? or @laboratory.first.user_id == user
	end
end
