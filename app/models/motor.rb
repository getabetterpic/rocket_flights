class Motor < ActiveRecord::Base
  validates_presence_of :name, :diameter_in_mm, :manufacturer
  has_many :flight_motors
  has_many :flights, through: :flight_motors
  has_many :rockets, through: :flights

  before_validation :upcase_name

  validates_each :name do |record, attr, value|
    if value =~ /[^A-Z0-9\-\/]+/
      record.errors.add(attr, 'cannot contain any characters except A-Z, 0-9, -, and /')
    end
  end

  private

  def upcase_name
    name.upcase! if name.present?
  end
end
