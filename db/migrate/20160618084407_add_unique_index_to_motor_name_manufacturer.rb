class AddUniqueIndexToMotorNameManufacturer < ActiveRecord::Migration
  def change
    add_index :motors, [:name, :manufacturer], unique: true
  end
end
