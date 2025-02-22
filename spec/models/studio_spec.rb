require 'rails_helper'

RSpec.describe Studio do
  describe 'relationships' do
    it { should have_many(:movies) }
  end

  describe 'validations' do 
    it {validate_presence_of :name}
    it {validate_presence_of :location}
  end 
end
