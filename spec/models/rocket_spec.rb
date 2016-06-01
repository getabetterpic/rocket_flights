require 'rails_helper'

RSpec.describe Rocket, type: :model do
  it { should validate_presence_of :name }
  it { should have_many :flights }
  it { should have_many(:motors).through(:flights) }

  context '#successful_flights' do
    let(:rocket) { FactoryGirl.create(:rocket) }
    let(:motor) { FactoryGirl.create(:motor) }
    let!(:flight_1) { FactoryGirl.create(:flight, successful: true, rocket: rocket, motor: motor) }
    let!(:flight_2) { FactoryGirl.create(:flight, successful: false, rocket: rocket, motor: motor) }

    it 'returns only successful flights' do
      expect(rocket.successful_flights.count).to eq(1)
    end
  end
end
