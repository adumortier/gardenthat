require 'rails_helper'

RSpec.describe "As a registered user " , type: :feature do

  describe "Interacting with MyGarden" do

    before(:each) do
      @user1 = User.create!( email: 'gardenthat@gmail.com',
                            name: 'gardenthat',
                            zip_code: '02300',
                            google_token: 'temp',
                            google_refresh_token: 'temp'
                          )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
			@garden = Garden.create(name: 'A', user: @user1)
			@plant = Plant.new(name: 'tomato')
			@garden.plants << @plant
    end

    it "View Garden Plants" do
      visit "/user/mygardens"
      click_on "A"
      expect(current_path).to eq("/user/mygardens/#{@garden.id}")
      expect(page).to have_content('B')
    end
  end
end

