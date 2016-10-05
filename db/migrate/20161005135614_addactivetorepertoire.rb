class Addactivetorepertoire < ActiveRecord::Migration
  def change
  	add_column :repertoires, :active, :boolean
  	add_column :repertoires, :date_active, :date
  end
end
