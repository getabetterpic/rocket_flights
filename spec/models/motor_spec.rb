require 'rails_helper'

RSpec.describe Motor, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :manufacturer }
  it { should validate_presence_of :diameter_in_mm }
  it { should have_many :flight_motors }
  it { should have_many(:flights).through(:flight_motors) }
  it { should have_many(:rockets).through(:flights) }

  it 'upcases the motor name when saving' do
    motor = FactoryGirl.build(:motor, name: 'a8-3')
    motor.save
    expect(motor.name).to eq('A8-3')
  end

  it 'validates the motor name does not contain any unwanted characters' do
    expect { FactoryGirl.create(:motor, name: 'B5!-8') }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
