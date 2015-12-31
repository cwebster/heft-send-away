class LaboratoryPolicy
	attr_reader :user, :record

	def initialize(user, laboratory)
		@user = user
		@laboratory = laboratory
	end

	def index?
		user.admin? or @laboratory.first.user_id == user
	end
end