require 'rails_helper'

RSpec.describe Motor, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :manufacturer }
  it { should validate_presence_of :diameter_in_mm }
  it { should have_many :flight_motors }
  it { should have_many(:flights).through(:flight_motors) }
  it { should have_many(:rockets).through(:flights) }

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
