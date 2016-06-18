require 'rails_helper'

RSpec.describe Motor, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :manufacturer }
  it { should validate_presence_of :diameter_in_mm }
  it { should have_many :flight_motors }
  it { should have_many(:flights).through(:flight_motors) }
  it { should have_many(:rockets).through(:flights) }

  context 'validating the uniqueness of name' do
    it 'is not valid if duplicate names for same manufacturer' do
      motor1 = FactoryGirl.build(:motor, name: 'A8-3', manufacturer: 'Estes')
      motor2 = FactoryGirl.build(:motor, name: 'A8-3', manufacturer: 'Estes')
      expect(motor1.save).to be true
      motor2.save
      expect(motor2.errors.full_messages).to include('Name has already been taken')
    end
  end

  it 'successfully saves a correct motor' do
    motor = FactoryGirl.build(:motor, name: 'A8-3')
    expect(motor.save).to be true
  end

  it 'upcases the motor name when saving' do
    motor = FactoryGirl.build(:motor, name: 'a8-3')
    motor.validate!
    expect(motor.name).to eq('A8-3')
  end

  %w(! @ # $ % ^ & * \( \) _ + = ? < > : ; \' \" { } [ ] | \\).each do |char|
    it "validates the motor name does not contain an #{char}" do
      expect { FactoryGirl.create(:motor, name: "B5#{char}-8") }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
