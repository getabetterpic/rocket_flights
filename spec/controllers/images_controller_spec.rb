require 'rails_helper'

RSpec.describe ImagesController, type: :controller do

  describe "GET #create" do
    let(:image) { fixture_file_upload('images/ariel_and_4DF.jpg', 'image/jpeg') }
    let(:rocket) { FactoryGirl.create(:rocket) }
    it "returns http success" do
      post :create, { file: image, rocket: { id: rocket.id } }
      expect(response).to have_http_status(:created)
      expect(rocket.reload.images.count).to eq(1)
    end
  end

end
