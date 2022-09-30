class AddUserToAirlines < ActiveRecord::Migration[7.0]
  def change
    add_reference :airlines, :user, null: false, foreign_key: true
  end
end
