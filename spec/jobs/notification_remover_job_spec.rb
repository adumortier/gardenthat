require 'rails_helper'

RSpec.describe NotificationRemoverJob, type: :job do

  describe "#perform_later" do

    it "removes notifications", :vcr do
        user1 = User.create!( email: 'gardenthattesting@gmail.com',
                              name: 'gardenthattesting',
                              zip_code: '02300',
                              google_token: ENV['TEST_USER_GOOGLE_TOKEN'],
                              google_refresh_token: ENV['TEST_USER_GOOGLE_REFRESH_TOKEN'],
                              calendar_id: 'no5nrau9mnuut1420lotg7eu54@group.calendar.google.com'
                            )
        garden = Garden.create!(name: "A Nice Garden", user: user1)
        plant = Plant.create!(name: 'tomato', image: "https://www.almanac.com/sites/default/files/image_nodes/tomatoes_helios4eos_gettyimages-edit.jpeg")
        garden.plants << plant
        
        Garden.add_notification(garden, plant)
        garden_plant = GardenPlant.where("garden_id= #{garden.id} AND plant_id= #{plant.id}").first
        events = garden_plant.events.to_a
        ActiveJob::Base.queue_adapter = :test
          expect {
            NotificationRemoverJob.perform_later(events, user1)
          }.to have_enqueued_job
      end
  end

end
