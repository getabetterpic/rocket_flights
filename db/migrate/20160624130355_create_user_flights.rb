class CreateUserFlights < ActiveRecord::Migration
  def change
    create_table :user_flights do |t|
      t.references :user, index: true, foreign_key: true
      t.references :flight, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
