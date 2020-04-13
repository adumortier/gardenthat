class CreateGardenPlants < ActiveRecord::Migration[5.2]
  def change
    create_table :garden_plants do |t|
      t.references :plant, foreign_key: true
      t.references :garden, foreign_key: true
    end
  end
end
