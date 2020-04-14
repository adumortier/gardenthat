class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
			t.string :name
			t.string :image
      t.string :perennial
      t.string :first_harvest
      t.string :last_harvest
      t.string :description
      t.string :sun
      t.string :height
      t.string :spread
			t.string :sowing
      t.string :spacing
    end
  end
end
