class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.references :rocket, index: true, foreign_key: true
      t.references :motor, index: true, foreign_key: true
      t.boolean :successful
      t.text :notes
      t.datetime :flight_date

      t.timestamps null: false
    end
  end
end
