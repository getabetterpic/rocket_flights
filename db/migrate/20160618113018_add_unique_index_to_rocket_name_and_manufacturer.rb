class AddUniqueIndexToRocketNameAndManufacturer < ActiveRecord::Migration
  def change
    add_index :rockets, [:name, :manufacturer], unique: true
  end
end
