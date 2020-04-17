# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Profile Page', type: :feature do
  before(:each) do
    @user1 = User.create!(email: 'gardenthat@gmail.com',
                          name: 'gardenthat',
                          zip_code: '02300',
                          google_token: 'temp',
                          google_refresh_token: 'temp')
  end

  it 'can see its profile page' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    visit '/'

    click_on 'My Profile'

    expect(current_path).to eq("/profile/#{@user1.id}")
    expect(page).to have_content(@user1.email)
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user1.zip_code)
  end

  it 'renders a 404 if you try and visit the page without signing in' do
    user = User.create!(email: 'thing@gmail.com',
                        name: 'thatthing',
                        zip_code: '02300',
                        google_token: 'temp',
                        google_refresh_token: 'temp')
    visit "/profile/#{user.id}"

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
