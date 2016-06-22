class User < ActiveRecord::Base
  validates_presence_of :email
  validates_uniqueness_of :email, scope: :auth0_user_id, case_sensitive: false
end
