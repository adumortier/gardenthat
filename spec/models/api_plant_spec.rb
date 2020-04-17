# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApiPlant, type: :model do
  it 'has attributes' do
    plant = ApiPlant.new(name: 'tomato',
                         perennial: false,
                         first_harvest: 88,
                         last_harvest: 110,
                         description: 'The tomato is the fruit of the tomato plant, a member of the Nightshade family (Solanaceae). The fruit grows on a sprawling vine that is often trellised or caged to keep it upright. There are many kinds of tomatoes, including conventional, hybrid, heirloom, plum, grape, and cherry. Determinate or bush varieties do not need pruning and can be grown without trellises or cages. Indeterminate or climbing varieties benefit from pruning and should be trellised, caged, or staked.',
                         sun: 'Full Sun',
                         image: 'https://s3.amazonaws.com/openfarm-project/production/media/pictures/attachments/5dc3618ef2c1020004f936e4.jpg?1573085580',
                         height: 90,
                         spread: 60,
                         sowing: 'Direct seed indoors, transplant seedlings outside after hardening off',
                         spacing: 75)

    expect(plant).to have_attributes(name: 'tomato', perennial: false,
                                     first_harvest: 88,
                                     last_harvest: 110,
                                     description: 'The tomato is the fruit of the tomato plant, a member of the Nightshade family (Solanaceae). The fruit grows on a sprawling vine that is often trellised or caged to keep it upright. There are many kinds of tomatoes, including conventional, hybrid, heirloom, plum, grape, and cherry. Determinate or bush varieties do not need pruning and can be grown without trellises or cages. Indeterminate or climbing varieties benefit from pruning and should be trellised, caged, or staked.',
                                     sun: 'Full Sun',
                                     image: 'https://s3.amazonaws.com/openfarm-project/production/media/pictures/attachments/5dc3618ef2c1020004f936e4.jpg?1573085580',
                                     height: 90,
                                     spread: 60,
                                     sowing: 'Direct seed indoors, transplant seedlings outside after hardening off',
                                     spacing: 75)
  end
  it 'sets a defualt image if no image is present' do
    plant = ApiPlant.new(name: 'tomato',
                         perennial: false,
                         first_harvest: 88,
                         last_harvest: 110,
                         description: 'The tomato is the fruit of the tomato plant, a member of the Nightshade family (Solanaceae). The fruit grows on a sprawling vine that is often trellised or caged to keep it upright. There are many kinds of tomatoes, including conventional, hybrid, heirloom, plum, grape, and cherry. Determinate or bush varieties do not need pruning and can be grown without trellises or cages. Indeterminate or climbing varieties benefit from pruning and should be trellised, caged, or staked.',
                         sun: 'Full Sun',
                         image: nil,
                         height: 90,
                         spread: 60,
                         sowing: 'Direct seed indoors, transplant seedlings outside after hardening off',
                         spacing: 75)

    expect(plant).to have_attributes(name: 'tomato', perennial: false,
                                     first_harvest: 88,
                                     last_harvest: 110,
                                     description: 'The tomato is the fruit of the tomato plant, a member of the Nightshade family (Solanaceae). The fruit grows on a sprawling vine that is often trellised or caged to keep it upright. There are many kinds of tomatoes, including conventional, hybrid, heirloom, plum, grape, and cherry. Determinate or bush varieties do not need pruning and can be grown without trellises or cages. Indeterminate or climbing varieties benefit from pruning and should be trellised, caged, or staked.',
                                     sun: 'Full Sun',
                                     image: 'https://www.aisd.net/burgin-elementary/wp-content/files/sites/54/2018/08/No-image-available.jpg',
                                     height: 90,
                                     spread: 60,
                                     sowing: 'Direct seed indoors, transplant seedlings outside after hardening off',
                                     spacing: 75)
  end
end
