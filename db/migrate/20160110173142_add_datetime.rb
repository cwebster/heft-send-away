class AddDatetime < ActiveRecord::Migration
  def change
    add_column :laboratories, :date_selection_form_sent, :datetime
  end
end
