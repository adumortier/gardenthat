require 'rails_helper'

RSpec.describe User, type: :model do 

  describe 'validations' do 
    it { should validate_presence_of :name}
    it { should validate_presence_of :email}
    it { should validate_presence_of :google_token}
    it { should validate_presence_of :google_refresh_token}
    # it { should validate_presence_of :zip_code}
  end 

end