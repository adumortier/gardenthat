require 'rails_helper'

RSpec.describe GardenPlant, type: :model do
  describe 'relationships' do
    it {should belong_to :plant}
    it {should belong_to :garden}
    it {should have_many :events}
  end
end
