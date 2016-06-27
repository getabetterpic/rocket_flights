def setup_knock
  request.headers['Authorization'] = 'Bearer JWTTOKEN'
  knock = double("Knock")
  user = FactoryGirl.create(:user)
  yield user if block_given?
  allow(knock).to receive(:current_user).and_return(user)
  allow(knock).to receive(:authenticate).and_return(true)
  allow(Knock::AuthToken).to receive(:new).and_return(knock)
end
