class Rocket < ActiveRecord::Base
  validates_presence_of :name
  has_many :flights
  has_many :motors, through: :flights
end
