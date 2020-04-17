# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'plant service index', type: :request do
  it 'can get a list of calendar', :vcr do
    user1 = User.create!(email: 'gardenthattesting@gmail.com',
                         name: 'gardenthattesting',
                         zip_code: '02300',
                         google_token: ENV['TEST_USER_GOOGLE_TOKEN'],
                         google_refresh_token: ENV['TEST_USER_GOOGLE_REFRESH_TOKEN'])

    garden = Garden.create(name: 'My First Garden', user: user1)
    plant = Plant.new(name: 'tomato')

    expect(CalendarService.list_calendars(user1)).to_not be_empty
  end
end
