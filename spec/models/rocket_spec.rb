require 'rails_helper'

RSpec.describe Rocket, type: :model do
  it { should validate_presence_of :name }
end
