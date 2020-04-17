require 'rails_helper'

RSpec.describe "As a user " , type: :feature do

  describe "When I visit one of my gardens" do

    before(:each) do
       @user1 = User.create!( email: 'gardenthattesting@gmail.com',

                            name: 'gardenthattesting',
                            zip_code: '02300',
                            google_token: ENV['TEST_USER_GOOGLE_TOKEN'],
                            google_refresh_token: ENV['TEST_USER_GOOGLE_REFRESH_TOKEN'],
                            calendar_id: '5n59q0ueh4202i4mlstfbqejgc@group.calendar.google.com')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
      @garden = Garden.create(name: 'Garden 1', user: @user1)
    end


    it "I can delete the plants in my garden", :vcr do

      visit '/'
      fill_in 'search', with: 'tomato'
      click_on 'Search'
      click_on 'Tomato'
      click_on 'Add to MyGarden'
      click_link 'Garden 1'

      visit '/'
      fill_in 'search', with: 'carrot'
      click_on 'Search'
      click_on 'Carrot'
      click_on 'Add to MyGarden'
      click_link 'Garden 1'

      events1 = CalendarService.list_events(@user1)
      list_events1 = events1.map { |event| event[:name] }

      event_tomato1 = list_events1.find_all {|event| event.include?('Tomato')}
      event_carrot1 = list_events1.find_all {|event| event.include?('Carrot')}

      expect(event_tomato1.length).to eq(1)
      expect(event_carrot1.length).to eq(1)

      visit "/user/mygardens/#{@garden.id}"

      within(".delete-plant-#{@user1.gardens.first.plants.first.id}") do
        click_link "Delete"
      end

      events2 = CalendarService.list_events(@user1)
      list_events2 = events2.map {|event| event[:name]}

      event_tomato2 = list_events2.find_all {|event| event.include?('Tomato')}
      event_carrot2 = list_events2.find_all {|event| event.include?('Carrot')}

      expect(event_tomato2.length).to eq(0)
      expect(event_carrot2.length).to eq(1)

      visit "/user/mygardens/#{@garden.id}"

      within(".delete-plant-#{@user1.gardens.first.plants.first.id}") do
        click_link "Delete"
      end
    end
  end
end
