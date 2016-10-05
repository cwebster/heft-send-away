class Addemailtolaboratory < ActiveRecord::Migration
  def change
  	add_column :laboratories, :email, :string
  end
end
