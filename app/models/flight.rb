class Flight < ActiveRecord::Base
  belongs_to :rocket
  has_many :flight_motors
  has_many :motors, through: :flight_motors
end
