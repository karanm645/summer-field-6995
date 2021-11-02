require 'rails_helper'
RSpec.describe 'user sees one movie' do 
  describe 'they link from the studio index' do 
    it 'displays info for one movie' do 
      studio1 = Studio.create!(name: "Shotgun Production", location: "Brooklyn, NY")
      movie1 = studio1.movies.create!(title: "Gone with the wind", creation_year: 1977, genre: "Country Western")

      visit "/movies/#{movie1.id}" 

      cexpect(page).to have_content(movie1.title)
      cexpect(page).to have_content(movie1.creation_year)
      cexpect(page).to have_content(movie1.genre)
    end 
  end 
end 