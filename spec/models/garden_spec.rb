# frozen_string_literal: true

require 'rails_helper'

describe Garden, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many(:plants).through(:garden_plants) }
  end
end
