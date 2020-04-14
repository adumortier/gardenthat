require 'rails_helper'

RSpec.describe "As a registered user " , type: :feature do
  before(:each) do
    @user1 = User.create!( email: 'gardenthat@gmail.com',
                          name: 'gardenthat',
                          zip_code: '02300',
                          google_token: 'temp',
                          google_refresh_token: 'temp'
                        )

  end

  it "can see its porofile page" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    visit '/'

    click_on "My Profile"

    expect(page).to have_content(@user1.email)
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user1.zip_code)
    save_and_open_page
  end
end
