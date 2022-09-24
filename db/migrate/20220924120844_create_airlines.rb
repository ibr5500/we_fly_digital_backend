class CreateAirlines < ActiveRecord::Migration[7.0]
  def change
    create_table :airlines do |t|
      t.string :name
      t.string :logo
      t.integer :num_of_seats

      t.timestamps
    end
  end
end
