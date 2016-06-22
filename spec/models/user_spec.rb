require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  subject { FactoryGirl.build(:user) }
  it { should validate_uniqueness_of(:email).case_insensitive.scoped_to(:auth0_user_id) }
  it { should have_many(:rockets).through(:user_rockets) }
end
