class LaboratoriesUpdate < ActiveRecord::Migration

  def self.up
    rename_column :laboratories, :date_selection_form_sent, :date_request_for_information_sent
    add_column :laboratories, :date_information_updated, :datetime
  end

  def self.down
    # rename back if you need or do something else or do nothing
    rename_column :laboratories, :date_request_for_information_sent, :date_selection_form_sent
  end

end
