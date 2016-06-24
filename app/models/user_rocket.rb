class UserRocket < ActiveRecord::Base
  belongs_to :user
  belongs_to :rocket
end
