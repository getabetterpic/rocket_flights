class FlightResource < JSONAPI::Resource
  attributes :successful, :notes, :flight_date

  has_one :rocket
end
