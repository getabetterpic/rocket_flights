class FlightResource < JSONAPI::Resource
  attributes :successful, :notes, :flight_date, :altitude

  has_one :rocket
  has_many :flight_motors

  def self.apply_sort(records, order_options, context = {})
    records = records.order('flight_date DESC')
    super(records, order_options, context)
  end
end
