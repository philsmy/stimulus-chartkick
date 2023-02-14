class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.string :item_name
      t.integer :quantity
      t.float :purchase_amount
      t.datetime :purchased_at
      t.string :status
      t.references :customer, null: false, foreign_key: true


      t.timestamps
    end
  end
end
