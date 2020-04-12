class CreateStoreStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :store_stocks do |t|
      t.string :status
      t.belongs_to :car

      t.timestamps
    end
  end
end
