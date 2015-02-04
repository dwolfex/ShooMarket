class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.string :cart_id
      t.string :item_id
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
