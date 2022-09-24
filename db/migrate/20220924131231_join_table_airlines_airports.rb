class JoinTableAirlinesAirports < ActiveRecord::Migration[7.0]
  def change
    create_join_table :airlines, :airports do |t|
      t.index [:airline_id, :airport_id]
      t.index [:airport_id, :airline_id]
    end
  end
end
