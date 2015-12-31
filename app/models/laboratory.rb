class Laboratory < ActiveRecord::Base
  include Import
	has_many :laboratory_tests
  belongs_to :user

end
