class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
			t.string :name
			t.string :address
			t.string :city
			t.string :state
			t.string :zip
    end
  end
end
