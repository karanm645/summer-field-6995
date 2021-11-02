require 'rails_helper'

RSpec.describe Actor do 
  describe 'relationships' do 
    it { should have_many(:movies).through(:actor_movie) }
  end 

  describe 'validations' do 
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end 
end 