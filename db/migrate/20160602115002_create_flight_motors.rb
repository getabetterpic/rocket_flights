class CreateFlightMotors < ActiveRecord::Migration
  def change
    create_table :flight_motors do |t|
      t.references :flight, index: true, foreign_key: true
      t.references :motor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
