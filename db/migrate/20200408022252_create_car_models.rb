class CreateCarModels < ActiveRecord::Migration[6.0]
  def change
    create_table :car_models do |t|
      t.string :name
      t.decimal :cost
      t.decimal :price

      t.timestamps
    end
  end
end
