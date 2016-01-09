class Laboratory < ActiveRecord::Base
  include Import
  include AlgoliaSearch

  has_many :laboratory_tests
  belongs_to :user

  scope :date_completed_not_nil, -> {Laboratory.where('date_completed IS NOT NULL')}

  algoliasearch do
    attribute :laboratory_name, :city, :address1
  end

  def self.workload
    sql = 'select extract(year from age(date_completed)) * 12 + extract(month from age(date_completed)) as months,
       count(*) from laboratories group by months order by months;'

    records_array = ActiveRecord::Base.connection.execute(sql)

  end

end
