class AddManufacturerToMotor < ActiveRecord::Migration
  def change
    add_column :motors, :manufacturer, :string
  end
end
