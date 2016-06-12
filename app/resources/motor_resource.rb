class MotorResource < JSONAPI::Resource
  attributes :name, :manufacturer, :diameter_in_mm
  has_many :flight_motors
end
