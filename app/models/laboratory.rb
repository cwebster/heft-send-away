class Laboratory < ActiveRecord::Base
  include Import
  include AlgoliaSearch

  geocoded_by :full_street_address,
  :latitude => :latitude, :longitude => :longitude
  after_validation :geocode, :if => :changed?

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

  def self.out_of_date(months)
    Laboratory
      .where(['date_information_updated < ? OR date_information_updated IS NULL', months.months.ago])
      .order(:date_information_updated)
  end

  def self.out_of_date_update_letter_send(months)
    Laboratory
      .where(['date_information_updated < ? OR date_information_updated IS NULL', months.months.ago])
      .update_all(:date_request_for_information_sent => Date.today)
  end

  def self.waiting_for_update
    Laboratory
      .where(['date_information_updated < date_request_for_information_sent OR date_information_updated IS NULL'])
      .order(:date_information_updated)
  end

  def full_street_address
    "#{self.address1}, #{self.address2}, #{self.address3}, #{self.city}, #{self.postcode}"
  end

  def tests_offered
    LaboratoryTest.where(laboratory_id: self.id)
  end

  def send_away_records_complete
    Repertoire.where(laboratory_id: self.id, record_complete: true)
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
