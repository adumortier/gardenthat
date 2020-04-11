require 'rails_helper'

describe 'visitor' do
  it 'about' do
		visit '/'
    expect(page).to have_content('About')
		click_on 'About'
		expect(current_path).to eq('/about')
	end

	it 'login' do
		visit '/'
		click_on 'Sign In'
		expect(current_path).to eq('/login')	
	end

  it 'sign out' do
    user1 = User.create!( email: 'gardenthat@gmail.com', 
                          name: 'gardenthat', 
                          google_token: 'temp',
                          zip_code: '02139'
                        )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    visit '/'
    expect(page).to have_link('My Garden')
		click_on 'Sign Out'
		expect(current_path).to eq('/')	
	end
end
