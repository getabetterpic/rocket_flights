require 'rails_helper'

RSpec.describe Flight, type: :model do
  it { should belong_to :rocket }
  it { should have_many :flight_motors }
  it { should have_many(:motors).through(:flight_motors) }
end
