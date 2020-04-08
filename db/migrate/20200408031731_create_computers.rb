class CreateComputers < ActiveRecord::Migration[6.0]
  def change
    create_table :computers do |t|
      t.jsonb :status
      # t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
