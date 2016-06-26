class UserResource < JSONAPI::Resource
  attributes :email

  has_many :user_flights
  has_many :user_rockets
end
