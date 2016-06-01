require 'rails_helper'

RSpec.describe Flight, type: :model do
  it { should belong_to :rocket }
  it { should belong_to :motor }
end
