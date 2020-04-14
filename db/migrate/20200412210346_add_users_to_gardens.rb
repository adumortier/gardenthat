class AddUsersToGardens < ActiveRecord::Migration[5.2]
  def change
    add_reference :gardens, :user, foreign_key: true
  end
end
