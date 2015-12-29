class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username,              null: false, default: ""
      t.string :first_name,              null: false, default: ""
      t.string :surname,              null: false, default: ""
      t.string :title,              null: false, default: ""
      t.timestamps null: false
    end
  end
end
