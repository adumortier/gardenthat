require 'rails_helper'

RSpec.describe "Delete Profile" , type: :feature do
  it 'can deletes a profile' do
    user = User.create!( email: 'gardenthat@gmail.com',
                          name: 'gardenthat',
                          zip_code: '02300',
                          google_token: 'temp',
                          google_refresh_token: 'temp'
                        )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/profile/#{user.id}"

    expect(User.all.last).to eq(user)

    click_on 'Delete Profile'

    expect(current_path).to eq('/')

    expect(page).to have_content("Profile Deleted")
    expect(User.all).to eq([])
  end
end
