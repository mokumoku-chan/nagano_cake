class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :production_status, null: false
      t.integer :amount, null: false
      t.integer :price, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end
