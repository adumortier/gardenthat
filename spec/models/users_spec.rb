require 'rails_helper'

RSpec.describe User, type: :model do 

  describe 'validations' do 
    it { should validate_presence_of :email}
    it { should validate_presence_of :google_token}
    it { should validate_uniqueness_of(:email) }
  end 

  describe 'class methods' do 
    it '#from_omniauth' do
      auth = 
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
      user = User.from_omniauth(auth)
      expect(user.email).to eq("gardenthat@gmail.com")
      expect(user.name).to eq("gardenthat")
    end
  end

end