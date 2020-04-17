require 'rails_helper'

RSpec.describe "As a user " , type: :feature do

  describe "When I visit one of my gardens" do

    before(:each) do
       @user1 = User.create!( email: 'gardenthattesting@gmail.com',
                            name: 'gardenthattesting',
                            zip_code: '02300',
                            google_token: ENV['TEST_USER_GOOGLE_TOKEN'],
                            google_refresh_token: ENV['TEST_USER_GOOGLE_REFRESH_TOKEN']
                          )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
			@garden = Garden.create(name: 'Garden 1', user: @user1)
      @plant1 = Plant.new(name: 'tomato', image: "https://www.almanac.com/sites/default/files/image_nodes/tomatoes_helios4eos_gettyimages-edit.jpeg")
      @plant2 = Plant.new(name: 'basil', image: "https://www.almanac.com/sites/default/files/image_nodes/tomatoes_helios4eos_gettyimages-edit.jpeg")
      @garden.plants << @plant1
      @garden.plants << @plant2
    end

    it "I can delete the plants in my garden" do

      expect(GardenPlant.where("garden_id= #{@garden.id} AND plant_id= #{@plant1.id}")).to_not be_empty
      expect(GardenPlant.where("garden_id= #{@garden.id} AND plant_id= #{@plant2.id}")).to_not be_empty

      visit "/user/mygardens/#{@garden.id}"
      within(".plant-#{@plant1.id}") do
        click_link "Delete"
      end

      expect(GardenPlant.where("garden_id= #{@garden.id} AND plant_id= #{@plant1.id}")).to be_empty
      expect(GardenPlant.where("garden_id= #{@garden.id} AND plant_id= #{@plant2.id}")).to_not be_empty

    end

  end

end
