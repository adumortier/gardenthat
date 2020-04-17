class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event_id
      t.references :garden_plant, foreign_key: true
    end
  end
end
