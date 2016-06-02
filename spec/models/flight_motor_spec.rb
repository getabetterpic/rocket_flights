require 'rails_helper'

RSpec.describe FlightMotor, type: :model do
  it { should belong_to :flight }
  it { should belong_to :motor }
end
