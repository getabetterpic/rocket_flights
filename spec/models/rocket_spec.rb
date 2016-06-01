require 'rails_helper'

RSpec.describe Rocket, type: :model do
  it { should validate_presence_of :name }
  it { should have_many :flights }
  it { should have_many(:motors).through(:flights) }
end
