class CreateOrderChanges < ActiveRecord::Migration[6.0]
  def change
    create_table :order_changes do |t|
      t.belongs_to :order
      t.belongs_to :store_stock
      t.timestamps
    end
  end
end
