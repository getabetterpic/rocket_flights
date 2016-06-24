class UserFlightResource < JSONAPI::Resource
  filter :user_id
  has_one :flight
  has_one :user
end
