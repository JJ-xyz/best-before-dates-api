class CreateHouseholds < ActiveRecord::Migration[5.0]
  def change
    create_table :households do |t|
      t.string :name
      t.integer :num_people

      t.timestamps
    end
  end
end
