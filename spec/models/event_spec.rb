require 'rails_helper'

RSpec.describe Event, type: :model do 

  describe 'validations' do 
    it { should validate_presence_of :event_id}
  end 

  describe 'relationships' do 
    it { should belong_to :garden_plant }
  end 

end