require 'rails_helper'

RSpec.describe Plant, type: :model do 
  
  it "attributes" do

    plant = Plant.new(name: 'tomato',
          perennial: false,
          first_harvest: 88,
          last_harvest: 110,
          description: "The tomato is the fruit of the tomato plant, a member of the Nightshade family (Solanaceae). The fruit grows on a sprawling vine that is often trellised or caged to keep it upright. There are many kinds of tomatoes, including conventional, hybrid, heirloom, plum, grape, and cherry. Determinate or bush varieties do not need pruning and can be grown without trellises or cages. Indeterminate or climbing varieties benefit from pruning and should be trellised, caged, or staked.",
          sun: "Full Sun",
          image: "https://s3.amazonaws.com/openfarm-project/production/media/pictures/attachments/5dc3618ef2c1020004f936e4.jpg?1573085580",
          height: 90,
          spread: 60,
          sowing: "Direct seed indoors, transplant seedlings outside after hardening off",
          spacing: 75
          )
    expect(plant).to have_attributes(name: 'tomato', perennial: false,
          first_harvest: 88,
          last_harvest: 110,
          description: "The tomato is the fruit of the tomato plant, a member of the Nightshade family (Solanaceae). The fruit grows on a sprawling vine that is often trellised or caged to keep it upright. There are many kinds of tomatoes, including conventional, hybrid, heirloom, plum, grape, and cherry. Determinate or bush varieties do not need pruning and can be grown without trellises or cages. Indeterminate or climbing varieties benefit from pruning and should be trellised, caged, or staked.",
          sun: "Full Sun",
          image: "https://s3.amazonaws.com/openfarm-project/production/media/pictures/attachments/5dc3618ef2c1020004f936e4.jpg?1573085580",
          height: 90,
          spread: 60,
          sowing: "Direct seed indoors, transplant seedlings outside after hardening off",
          spacing: 75)
  end 
    

end