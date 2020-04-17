# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a registered user ', type: :feature do
  describe 'Deleting Mygarden' do
    before(:each) do
      @user1 = User.create!(email: 'gardenthattesting@gmail.com',
                            name: 'gardenthattesting',
                            zip_code: '02300',
                            google_token: ENV['TEST_USER_GOOGLE_TOKEN'],
                            google_refresh_token: ENV['TEST_USER_GOOGLE_REFRESH_TOKEN'])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
      @garden = Garden.create(name: 'Garden 1', user: @user1)
      @plant = Plant.new(name: 'tomato', image: 'https://www.almanac.com/sites/default/files/image_nodes/tomatoes_helios4eos_gettyimages-edit.jpeg')
      @garden.plants << @plant
    end

    it 'Delete Garden', :vcr do
      visit '/user/mygardens'
      expect(page).to have_content('Garden 1')
      click_on 'Delete Garden'
      expect(page).to_not have_content('Garden 1')
    end
  end
end
