class Rocket < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :manufacturer }
  has_many :flights
  has_many :motors, through: :flights
  has_many :images, as: :imageable

  def successful_flights
    flights.where(successful: true)
  end

  def add_image(image)
    self.images << image if image.persisted?
  end
end
