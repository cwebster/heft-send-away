class Changeactivetoactivecheck < ActiveRecord::Migration
  def change
  	rename_column :repertoires, :active, :inactive
  end
end
