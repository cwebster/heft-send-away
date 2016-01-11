class RenameDateCompleted < ActiveRecord::Migration
  def change
    rename_column :laboratories, :date_completed, :date_selection_form_completed
  end
end
