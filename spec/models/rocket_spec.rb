require 'rails_helper'

RSpec.describe Rocket, type: :model do
  it { should validate_presence_of :name }
  it { should have_many :flights }
  it { should have_many(:motors).through(:flights) }

  context '#successful_flights' do
    let(:rocket) { FactoryGirl.create(:rocket) }
    let(:motor) { FactoryGirl.create(:motor) }
    let!(:flight_1) { FactoryGirl.create(:flight, successful: true, rocket: rocket) }
    let!(:flight_2) { FactoryGirl.create(:flight, successful: false, rocket: rocket) }
    let(:flight_motors_1) { FactoryGirl.create(:flight_motor, flight: flight_1, motor: motor) }
    let(:flight_motors_2) { FactoryGirl.create(:flight_motor, flight: flight_2, motor: motor) }

    it 'returns only successful flights' do
      expect(rocket.successful_flights.count).to eq(1)
    end

    context 'when validating name' do
      it 'validates uniqueness of name scoped to manufacturer' do
        rocket1 = FactoryGirl.build(:rocket, name: '4DF', manufacturer: 'U.S. Rockets')
        rocket2 = FactoryGirl.build(:rocket, name: '4DF', manufacturer: 'U.S. Rockets')
        expect(rocket1.save).to be true
        rocket2.save
        expect(rocket2.errors.full_messages).to include('Name has already been taken')
      end

      it 'allows the same name for different manufacturers' do
        rocket1 = FactoryGirl.build(:rocket, name: '4DF', manufacturer: 'U.S. Rockets')
        rocket2 = FactoryGirl.build(:rocket, name: '4DF', manufacturer: 'Estes')
        expect(rocket1.save).to be true
        expect(rocket2.save).to be true
      end
    end
  end
end
