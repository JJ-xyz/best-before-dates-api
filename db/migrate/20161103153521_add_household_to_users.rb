class AddHouseholdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :household, foreign_key: true
  end
end
