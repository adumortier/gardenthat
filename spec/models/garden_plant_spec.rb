RSpec.describe GardenPlant, type: :model do
  describe "relationships" do
    it {should belong_to :plant}
    it {should belong_to :garden}
  end
end
