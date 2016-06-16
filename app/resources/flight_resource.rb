class FlightResource < JSONAPI::Resource
  attributes :successful, :notes, :flight_date, :altitude

  has_one :rocket
  has_many :flight_motors
end
