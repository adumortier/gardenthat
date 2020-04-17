# frozen_string_literal: true

require 'rails_helper'

describe Plant, type: :model do
  describe 'relationships' do
    it { should have_many :garden_plants }
    it { should have_many(:gardens).through(:garden_plants) }
  end
end
