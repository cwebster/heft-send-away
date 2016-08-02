class AddRecordCompleteRecordToRepertoire < ActiveRecord::Migration
  def change
    add_column :repertoires, :record_complete, :boolean
  end
end
