class CreateMotors < ActiveRecord::Migration
  def change
    create_table :motors do |t|
      t.decimal :diameter_in_mm, required: true, null: false
      t.string :name, required: true, null: false

      t.timestamps null: false
    end
  end
end
