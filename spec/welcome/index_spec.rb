require 'rails_helper'

RSpec.describe "welcome index page", type: :feature do
  it "can see welcome message" do

    visit "/"

    expect(page).to have_content("Welcome To GardenThat!")
  end
end
