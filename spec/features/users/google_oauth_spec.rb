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

    it 'it starts creating a new user with an oauth hash returned' do
      user = User.from_omniauth(@auth)
      expect(user.email).to eq("gardenthat@gmail.com")
      expect(user.name).to eq("gardenthat")
    end

    it 'it lets me sign in through google and redirects me to the welcome page only if I dont have a zip code stored' do
      visit '/'
      click_on 'Sign In'
      expect(current_path).to eq('/login')
      click_on 'Sign in with Google'
      expect(User.last.zip_code.nil?).to eq(true)
      expect(current_path).to eq('/profile/questionaire')
      fill_in :zip_code, with: '02139'
      click_on 'Send'
      expect(current_path).to eq('/')
      expect(User.last.zip_code).to eq('02139')
      expect(page).to_not have_link('Sign in')
      visit '/login'
      expect(page).to have_content("The page you were looking for doesn't exist.")
      click_on 'Sign Out'
      expect(current_path).to eq('/')
      visit '/login'
      click_on 'Sign in with Google'
      expect(current_path).to eq('/')
    end
    
end



