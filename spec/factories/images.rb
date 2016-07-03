include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :image do
    image { fixture_file_upload('spec/fixtures/images/ariel_and_4DF.jpg', 'image/jpeg') }
  end
end
