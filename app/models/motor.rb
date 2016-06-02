class Motor < ActiveRecord::Base
  validates_presence_of :name, :diameter_in_mm
  has_many :flight_motors
  has_many :flights, through: :flight_motors
  has_many :rockets, through: :flights
end
