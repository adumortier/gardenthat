require 'rails_helper'

RSpec.describe "Edit Profile " , type: :feature do
  before(:each) do
    @user1 = User.create!( email: 'gardenthat@gmail.com',
                          name: 'gardenthat',
                          zip_code: '02300',
                          google_token: 'temp',
                          google_refresh_token: 'temp'
                        )

  end

  it "can successfully edit thier profile" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    visit "/profile/#{@user1.id}"

    click_on 'Edit Profile'

    expect(current_path).to eq("/profile/#{@user1.id}/edit")

    expect(page).to have_selector("input[value='02300']")

    fill_in :zip_code, with: "80003"

    click_button 'Update Profile'

    expect(current_path).to eq("/profile/#{@user1.id}")
    expect(page).to have_content('80003')
    expect(page).to have_content('Profile Updated!')
  end
end
