class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :changes_amount
      t.belongs_to :store_stock

      t.timestamps
    end
  end
end
