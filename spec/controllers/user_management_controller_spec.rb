require 'rails_helper'

RSpec.describe UserManagementController, type: :controller do
  before :each do
    User.destroy_all
  end

  it 'creates a new user if none exists with the auth0_user_id' do
    expect(User.count).to eq(0)
    auth_key = ENV['DEV_SECRET']
    params = { 'identity' => {
                  'user_id' => 'auth0|1', 'email' => 'dan@danandjensmith.com'},
                'auth' => auth_key }
    put :update, params
    expect(User.count).to eq(1)
  end

  it 'updates an existing user' do
    user = FactoryGirl.create(:user, auth0_user_id: 'auth0|2', email: 'amelia@earhart.com')
    auth_key = ENV['DEV_SECRET']
    params = { 'identity' => {
                'user_id' => user.auth0_user_id,
                'email' => 'charles@lindbergh.com' },
               'auth' => auth_key }
    put :update, params
    expect(user.reload.email).to eq('charles@lindbergh.com')
  end
end
