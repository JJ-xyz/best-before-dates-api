class AddHouseholdToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :household, foreign_key: true
  end
end
