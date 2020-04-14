class CreateWarehouseStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :warehouse_stocks do |t|
      t.string :status
      t.belongs_to :car

      t.timestamps
    end
  end
end
