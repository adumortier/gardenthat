require 'rails_helper'

RSpec.describe "Plant Search Page" , type: :feature do
  it "the user can get more details about thier search", :vcr do
      user1 = User.create!( email: 'gardenthat@gmail.com',
                            name: 'gardenthat',
                            zip_code: '02300',
                            google_token: 'temp',
                            google_refresh_token: 'temp'
                          )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      visit '/'
      fill_in :search, with: 'tomato'
      click_on 'Search'

      expect(current_path).to eq('/search')

      within('.plant_info') do
        click_on 'Tomato'
      end

      expect(current_path).to eq('/search/details.tomato')

      within('.plant_details') do
        expect(page).to have_content('tomato')
        expect(page).to have_content('false')
        expect(page).to have_content(88)
        expect(page).to have_content(110)
        expect(page).to have_content("The tomato is the fruit of the tomato plant, a member of the Nightshade family (Solanaceae). The fruit grows on a sprawling vine that is often trellised or caged to keep it upright. There are many kinds of tomatoes, including conventional, hybrid, heirloom, plum, grape, and cherry. Determinate or bush varieties do not need pruning and can be grown without trellises or cages. Indeterminate or climbing varieties benefit from pruning and should be trellised, caged, or staked.")
        expect(page).to have_content('Full Sun')
        expect(page).to have_content(90)
        expect(page).to have_content(60)
        expect(page).to have_content("Direct seed indoors, transplant seedlings outside after hardening off")
        expect(page).to have_content(75)
      end
  end
  
    it "shows a link to login ", :vcr do
      visit '/'
      fill_in :search, with: 'tomato'
      click_on 'Search'

      expect(current_path).to eq('/search')

      within('.plant_info') do
        click_on 'Tomato'
      end

      expect(current_path).to eq('/search/details.tomato')
      expect(page).to have_link('Login With Google to Add to your Garden!')
    end

    it 'displays error message if no details on the plant are avaiable', :vcr do
      user1 = User.create!( email: 'gardenthat@gmail.com',
                            name: 'gardenthat',
                            zip_code: '02300',
                            google_token: 'temp',
                            google_refresh_token: 'temp'
                          )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      visit '/'
      fill_in :search, with: 'tomato'
      click_on 'Search'

      expect(current_path).to eq('/search')

      within('.plant_info') do
        click_on 'Roma tomato'
      end

      expect(current_path).to eq('/search/details.Roma%20tomato')
      expect(page).to have_content('We are sorry, no details currently avaiable for this plant. Check back soon.')
    end
end
