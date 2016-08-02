class RefactorDataModelReal < ActiveRecord::Migration
  def self.up
    add_column :repertoires, :date_selection_form_completed, :date
    add_column :repertoires, :selection_form_completed, :bool
    add_column :repertoires, :website_updated, :bool
    add_column :repertoires, :date_request_for_information_sent, :date
    add_column :repertoires, :date_information_updated, :date
  end


  def self.down
    remove_column :repertoires, :date_selection_form_completed, :date
    remove_column :repertoires, :selection_form_completed, :bool
    remove_column :repertoires, :website_updated, :bool
    remove_column :repertoires, :date_request_for_information_sent, :date
    remove_column :repertoires, :date_information_updated, :date
  end
end
