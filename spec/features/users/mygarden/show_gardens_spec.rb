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

    it "see all my gardens" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
			garden = Garden.create(name: "A Nice Garden", user: @user1)
			visit '/'
			click_on 'My Garden'
			expect(current_path).to eq("/user/mygardens")
			expect(page).to have_content("A Nice Garden")
		end

		it "catch unregistered user" do
			visit '/'
			expect(page).to_not have_content("My Garden")
			visit '/user/mygardens'
			expect(page.status_code).to eq(200)
		end
	end
end
