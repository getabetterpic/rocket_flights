require 'rails_helper'

RSpec.describe Motor, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :manufacturer }
  it { should validate_presence_of :diameter_in_mm }
  it { should have_many :flight_motors }
  it { should have_many(:flights).through(:flight_motors) }
  it { should have_many(:rockets).through(:flights) }
end
