class MotorResource < JSONAPI::Resource
  attributes :name, :manufacturer, :diameter_in_mm
  has_many :flight_motors

  def self.apply_sort(records, order_options, context = {})
    records = records.order('manufacturer, name')
    super(records, order_options, context)
  end
end
