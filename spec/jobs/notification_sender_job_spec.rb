require 'rails_helper'

RSpec.describe NotificationSenderJob, type: :job do

  describe "#perform_later" do

    it "sends notifications" do
			user1 = User.create!( email: 'gardenthat@gmail.com',
                            name: 'gardenthat',
                            zip_code: '02300',
                            google_token: 'temp',
                            google_refresh_token: 'temp'
                          )
      garden = Garden.create!(name: "A Nice Garden", user: user1)
      plant = Plant.create!(name: 'tomato', image: "https://www.almanac.com/sites/default/files/image_nodes/tomatoes_helios4eos_gettyimages-edit.jpeg")
    
      ActiveJob::Base.queue_adapter = :test
        expect {
          NotificationSenderJob.perform_later(garden, plant)
        }.to have_enqueued_job
    end

  end
end
