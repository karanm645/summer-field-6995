require 'rails_helper'
RSpec.describe 'studio index page' do 
  describe 'they visit /studios' do 
    it 'displays all studios with name and location' do 
      studio1 = Studio.create!(name: "Def Jam", location: "Brooklyn, NY")
      studio2 = Studio.create!(name: "One Love", location: "SF, CA")
    
      visit '/studios'

      expect(page).to have_content(studio1.name)
      expect(page).to have_content(studio1.location)
      expect(page).to have_content(studio2.name)
      expect(page).to have_content(studio2.location)
    end 
  end 
end 