class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :item_info, null: false
      t.integer :item_category_id, null: false
      t.integer :item_sales_status_id, null: false
      t.integer :item_shipping_id, null: false
      t.integer :item_prefecture_id, null: false
      t.integer :item_scheduled_delivery_id, null: false
      t.integer :price, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
