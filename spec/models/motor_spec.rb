require 'rails_helper'

RSpec.describe Motor, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :diameter_in_mm }
end
