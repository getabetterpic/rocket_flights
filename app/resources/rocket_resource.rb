class RocketResource < JSONAPI::Resource
  attributes :name, :manufacturer

  has_many :flights
end
