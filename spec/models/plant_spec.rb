describe Plant, type: :model do
#        describe "validations" do
#                it { should validate_presence_of :Y }
#        end
        describe 'relationships' do
                it {should have_many :garden_plants}
                it { should have_many(:gardens).through(:garden_plants)}
        end
end
