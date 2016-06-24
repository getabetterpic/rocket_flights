class Rocket < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :manufacturer }
  has_many :flights
  has_many :motors, through: :flights

  def successful_flights
    flights.where(successful: true)
  end
end
