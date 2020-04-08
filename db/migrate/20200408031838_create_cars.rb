class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.integer :year
      t.references :computer, null: false, foreign_key: true
      t.boolean :completed
      t.string :assembly_stage
      t.references :car_model, null: false, foreign_key: true

      t.timestamps
    end
  end
end
