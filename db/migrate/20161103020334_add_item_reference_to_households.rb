class AddItemReferenceToHouseholds < ActiveRecord::Migration[5.0]
  def change
    add_reference :households, :item, foreign_key: true
  end
end
