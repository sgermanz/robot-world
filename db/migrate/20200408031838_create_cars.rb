class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.integer :year
      t.boolean :completed
      t.string :assembly_stage
      t.belongs_to :car_model

      t.timestamps
    end
  end
end
