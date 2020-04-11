require 'rails_helper'

RSpec.describe "As a registered user " , type: :feature do 

  describe "I can enter a search in the nav bar" do 

    before(:each) do 

    end

    it "the search returns the result matching the search", :vcr do
    
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
        expect(first('.name').text).to_not be_empty
         expect(page).to have_css("img[src*='https://s3.amazonaws.com/openfarm-project/production/media/pictures/attachments/5dc3618ef2c1020004f936e4.jpg?1573085580']")
        expect(first('.description').text).to_not be_empty  
      end
        # expect(first('.perennial').text).to_not be_empty
        # expect(first('.first_harvest').text).to_not be_empty
        # expect(first('.last_harvest').text).to_not be_empty
        # expect(first('.height').text).to_not be_empty
        # expect(first('.spread').text).to_not be_empty
        # expect(first('.sun').text).to_not be_empty
        # expect(first('.spacing').text).to_not be_empty
        # expect(first('.sowing').text).to_not be_empty
      end
    end

  end

