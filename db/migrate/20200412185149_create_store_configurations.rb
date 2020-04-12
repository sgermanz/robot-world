class CreateStoreConfigurations < ActiveRecord::Migration[6.0]
  def change
    create_table :store_configurations do |t|
      t.jsonb :configuration

      t.timestamps
    end
  end
end
