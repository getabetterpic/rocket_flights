class AddAltitudeToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :altitude, :integer
  end
end
