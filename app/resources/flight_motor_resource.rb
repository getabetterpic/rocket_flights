class FlightMotorResource < JSONAPI::Resource
  has_one :flight
  has_one :motor
end
