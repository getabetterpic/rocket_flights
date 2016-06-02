class FlightMotor < ActiveRecord::Base
  belongs_to :flight
  belongs_to :motor
end
