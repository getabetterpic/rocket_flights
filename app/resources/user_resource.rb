class UserResource < JSONAPI::Resource
  attributes :email

  has_many :user_flights
end
