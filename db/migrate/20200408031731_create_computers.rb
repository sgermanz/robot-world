class CreateComputers < ActiveRecord::Migration[6.0]
  def change
    create_table :computers do |t|
      t.jsonb :status
      t.belongs_to :car

      t.timestamps
    end
  end
end
