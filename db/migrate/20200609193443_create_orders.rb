# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :shopify_order_id, null: false
      t.string :shopify_order_number, default: ''
      t.string :shopify_customer_name, null: false
      t.belongs_to :shop, index: true
      t.timestamps
    end

    add_index :orders, :shopify_order_id, unique: true
  end
end
