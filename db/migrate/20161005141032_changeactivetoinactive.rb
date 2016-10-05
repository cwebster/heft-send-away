class Changeactivetoinactive < ActiveRecord::Migration
  def change
  	rename_column :repertoires, :date_active, :date_inactive
  end
end
