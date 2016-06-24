require 'rails_helper'

RSpec.describe UserRocket, type: :model do
  it { should belong_to :user }
  it { should belong_to :rocket }
end
