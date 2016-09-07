class Laboratory < ActiveRecord::Base
  include Import
  include AlgoliaSearch

  geocoded_by :full_street_address,
  :latitude => :latitude, :longitude => :longitude
  after_validation :geocode

  has_many :laboratory_tests
  has_many :repertoires
  belongs_to :user

  scope :date_completed_not_nil, -> {Laboratory.where('date_information_updated IS NOT NULL')}

  algoliasearch do
    attribute :laboratory_name, :city, :address1
  end

  def self.import_laboratories(file)
    data = File.read file
    ActiveRecord::Base.connection.execute(data)
  end

  def self.workload
    sql = 'select extract(year from age(date_information_updated)) * 12 + extract(month from age(date_information_updated)) as months,
    count(*) from laboratories group by months order by months;'

    ActiveRecord::Base.connection.execute(sql)
  end

  def full_street_address
    "#{self.address1}, #{self.address2}, #{self.address3}, #{self.city}, #{self.postcode}"
  end

  def tests_offered
    LaboratoryTest.where(laboratory_id: self.id)
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
