class LaboratoryTestPolicy
  attr_reader :user, :record

def initialize(user, laboratory_test)
  @user = user
  @laboratory_test = laboratory_test
end

def index?
  user.admin? || @laboratory_test.first.laboratory.user_id == user.id
end

def edit?
  user.admin? || @laboratory_test.laboratory.user_id == user.id
end

def update?
  user.admin? || @laboratory_test.laboratory.user_id == user.id
end

def show?
  user.admin? || @laboratory_test.laboratory.user_id == user.id
end

end
