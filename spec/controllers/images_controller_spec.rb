require 'rails_helper'
require_relative '../support/auth0.rb'

RSpec.describe ImagesController, type: :controller do

  describe "GET #create" do
    let(:image) { fixture_file_upload('images/ariel_and_4DF.jpg', 'image/jpeg') }
    let(:rocket) { FactoryGirl.create(:rocket) }

    it "returns http success" do
      setup_knock
      post :create, { file: image, rocket_id: rocket.id }
      expect(response).to have_http_status(:created)
      expect(rocket.reload.images.count).to eq(1)
    end
  end

end
