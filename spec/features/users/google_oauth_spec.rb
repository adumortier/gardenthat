require 'rails_helper'

describe 'As a registered user' do
    before(:each) do
      @auth = 
      {"provider"=>"google_oauth2",
      "uid"=>"110287008629109688070",
      "info"=>
      {"name"=>"gardenthat",
      "email"=>"gardenthat@gmail.com",
      "unverified_email"=>"gardenthat@gmail.com",
      "email_verified"=>true,
      "first_name"=>"garden",
      "last_name"=>"that",
      "image"=>"https://lh5.googleusercontent.com/-tQg6CB8oRnU/AAAAAAAAAAI/AAAAAAAAAAA/AAKWJJNoz_SwUPWyPTWT1JKtinZctQiGgQ/photo.jpg"},
      "credentials"=>
        {"token"=>ENV['TEST_USER_GOOGLE_TOKEN'],
        "refresh_token"=>ENV['TEST_USER_GOOGLE_REFRESH_TOKEN'],
        "expires_at"=>1586473803,
        "expires"=>true}}
                
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(@auth)
      end

    it 'it lets me sign in through google' do
        user1_params = { email: 'gardenthat@gmail.com', name: 'gardenthat', zip_code: '02300', google_token: 'temp', google_refresh_token: 'temp' }
        user1 = User.create!(user1_params)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
        visit '/login'
        click_on 'Login with Google'
        expect(user1.google_token).to eq("temp")
    end

    it "it redirects me to the questionaire if I don't have a zip code stored" do
        user1_params = { email: 'gardenthat@gmail.com', name: 'gardenthat', google_token: 'temp', google_refresh_token: 'temp' }
        user1 = User.create!(user1_params)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
        visit '/login'
        click_on 'Login with Google'
        expect(current_path).to eq('/profile/questionaire')
        fill_in :zip_code, with: '02139'
        click_on 'Send'
        expect(current_path).to eq('/')
        expect(user1.zip_code).to eq('02139')
    end


    it 'it creates a new user with an oauth hash returned' do
      user = User.from_omniauth(@auth)
      expect(user.email).to eq("gardenthat@gmail.com")
      expect(user.name).to eq("gardenthat")
    end
end



