class UserRocketResource < JSONAPI::Resource
  filter :user_id
  has_one :rocket
  has_one :user
end
