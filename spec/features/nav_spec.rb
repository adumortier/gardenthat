require 'rails_helper'

describe 'vister' do
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
		visit '/'
		click_on 'Sign Out'
		expect(current_path).to eq('/')	
	end
end
