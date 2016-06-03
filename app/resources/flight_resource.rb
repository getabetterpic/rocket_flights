class FlightResource < JSONAPI::Resource
  attributes :successful, :notes, :flight_date
end
