require 'rails_helper'

RSpec.describe PlantLoaderJob, type: :job do

  describe "#perform_later" do

    it "loads all plant" do
			
      ActiveJob::Base.queue_adapter = :test
        expect {
          PlantLoaderJob.perform_later
        }.to have_enqueued_job
    end

  end
end

