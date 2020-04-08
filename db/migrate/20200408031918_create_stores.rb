class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.references :car_model, null: false, foreign_key: true
      t.integer :stock

      t.timestamps
    end
  end
end
