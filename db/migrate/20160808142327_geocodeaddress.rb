class Geocodeaddress < ActiveRecord::Migration
  def change
    add_column :laboratories, :longitude, :float
    add_column :laboratories, :latitude, :float
  end
end
