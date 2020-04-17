# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Browse All Plants Page', type: :feature do
  it 'can list all avaiable plants to browse', :vcr do
    visit '/'

    click_on 'Browse All Plants'

    expect(current_path).to eq('/plants')

    within('.plant_info') do
      expect(first('.name').text).to_not be_empty
      expect(first('.description').text).to_not be_empty
    end

    expect(page).to have_link('Next')
  end
end
