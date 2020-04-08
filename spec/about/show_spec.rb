require 'rails_helper'

RSpec.describe "about show page", type: :feature do
  it "has content about the webiste" do

    visit '/'

    click_link 'About'
  
    expect(page).to have_content("About Gard(in) That")
    expect(page).to have_content("How To Use This Site")
    expect(page).to have_link("Trefle")
    expect(page).to have_content("Contact Us")
  end
end
