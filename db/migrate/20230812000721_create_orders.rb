class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :amount_billed, null: false
      t.integer :cusomer_id, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.string :post_number, null: false
      t.integer :postage, null: false, default: "800"
      t.integer :payment_method, null: false
      t.timestamps
    end
  end
end
