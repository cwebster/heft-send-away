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

  def self.out_of_date(months)
    Laboratory
    .where(["date_completed < ?", months.months.ago])
    .order(:date_completed)
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

end
