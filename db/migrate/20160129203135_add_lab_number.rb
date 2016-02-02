class AddLabNumber < ActiveRecord::Migration
  def change
    add_column :laboratories, :lab_number, :string
  end
end
