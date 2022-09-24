class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :num_of_seats
      t.string :category
      t.references :users, null: false, foreign_key: true
      t.references :airports, null: false, foreign_key: true
      t.references :airlines, null: false, foreign_key: true

      t.timestamps
    end
  end
end
