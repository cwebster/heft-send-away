class Label < ActiveRecord::Base

  alias_attribute :id, :user_id

  def self.labels_for_manufacturer_name(manufacturer_name)
    Label.where(manufacturer_name: manufacturer_name)
         .where(meter_active: true)
         .where(user_active: true)
  end

  def self.address_labels(user_ids)
    sql = ["SELECT user_id, first_name, surname, building, organisation, street,
                   region, postcode, count(device_serial_no) as num_meters
           FROM    labels
           WHERE   user_id in (%s)
           GROUP BY user_id, first_name, surname, building, organisation,
           street, region, postcode",
           user_ids.map(&:to_i).map{|x| x.inspect}.join(', ')]
    records_array = ActiveRecord::Base.connection.execute(sanitize_sql_array(sql))
  end


end
