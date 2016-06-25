class RocketResource < JSONAPI::Resource
  attributes :name, :manufacturer

  has_many :flights

  def self.apply_sort(records, order_options, context = {})
    records = records.order('manufacturer, name')
    super(records, order_options, context)
  end
end
