class CreateAirlines < ActiveRecord::Migration[7.0]
  def change
    create_table :airlines do |t|
      t.string :name
      t.string :image
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
