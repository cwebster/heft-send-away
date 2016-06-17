class CreateRepertoires < ActiveRecord::Migration
  def change
    create_table :repertoires do |t|
      t.belongs_to :laboratory
      t.references :laboratory_tests

      t.timestamps null: false
    end
  end
end
