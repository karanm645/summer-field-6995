require 'rails_helper'
RSpec.describe 'studio index page' do 
  describe 'they visit /studios' do 
    it 'displays all studios with name and location' do 
      studio1 = Studio.create!(name: "Shotgun Production", location: "Brooklyn, NY")
      studio2 = Studio.create!(name: "One Love", location: "SF, CA")
    
      visit '/studios'

      expect(page).to have_content(studio1.name)
      expect(page).to have_content(studio1.location)
      expect(page).to have_content(studio2.name)
      expect(page).to have_content(studio2.location)
    end 

    it 'displays all movies under each studio' do 
      studio1 = Studio.create!(name: "Shotgun Production", location: "Brooklyn, NY")
      studio2 = Studio.create!(name: "One Love", location: "SF, CA")
      movie1 = studio1.movies.create!(title: "Gone with the wind", creation_year: 1977, genre: "Country Western")
      movie2 = studio2.movies.create!(title: "Bend it Like Beckham", creation_year: 1999, genre: "RomCom")
      
      visit '/studios'

      expect(page).to have_content(movie1.title)
      expect(page).to have_content(movie2.title)
    end 
  end 
end 