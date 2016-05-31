class CreateRockets < ActiveRecord::Migration
  def change
    create_table :rockets do |t|
      t.string :name, required: true, null: false
      t.string :manufacturer
      t.decimal :length
      t.decimal :diameter
      t.decimal :center_of_pressure
      t.decimal :center_of_gravity
      t.decimal :drag_coefficient
      t.integer :stages

      t.timestamps null: false
    end
  end
end
