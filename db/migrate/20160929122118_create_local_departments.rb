class CreateLocalDepartments < ActiveRecord::Migration
  def change
    create_table :local_departments do |t|
    	t.string :department_name,              null: false, default: ""
    	t.timestamps null: false
    end
    add_column :repertoires, :local_department_id, :integer
    add_reference :repertoires, :local_departments, index: true, foreign_key: true
  end
end
