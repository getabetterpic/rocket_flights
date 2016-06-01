class Motor < ActiveRecord::Base
  validates_presence_of :name, :diameter_in_mm
  has_many :flights
  has_many :rockets, through: :flights
end
