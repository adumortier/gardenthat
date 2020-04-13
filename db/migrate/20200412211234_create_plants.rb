class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
			t.string :name
    end
  end
end
