class AddUserReferenceToHouseholds < ActiveRecord::Migration[5.0]
  def change
    add_reference :households, :user, foreign_key: true
  end
end
