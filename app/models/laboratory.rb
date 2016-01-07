class Laboratory < ActiveRecord::Base
  include Import
  include AlgoliaSearch

  has_many :laboratory_tests
  belongs_to :user

  algoliasearch do
    attribute :laboratory_name, :city, :address1
  end
end
