class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.datetime :exp_date
      t.datetime :date_purchased
      t.text :description
      t.string :where_to_buy
      t.string :rating
      t.integer :upc
      t.boolean :in_use

      t.timestamps
    end
  end
end
