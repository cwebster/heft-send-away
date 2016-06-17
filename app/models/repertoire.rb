class Repertoire < ActiveRecord::Base
  has_many :laboratory_tests
  belongs_to :laboratory
end
