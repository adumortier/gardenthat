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
    end

		it "Create a garden" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
      visit "/user/mygardens"
      click_link "Create New Garden"
      expect(current_path).to eq("/user/mygardens/new")
			fill_in :name, with: 'B'
			click_on "Create Garden"
			expect(current_path).to eq('/user/mygardens')
			expect(page).to have_content('B')
    end
	end
end
