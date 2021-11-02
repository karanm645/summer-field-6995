require 'rails_helper'
RSpec.describe 'user sees one movie' do 
  describe 'they link from the studio index' do 
    it 'displays info for one movie' do 
      studio1 = Studio.create!(name: "Shotgun Production", location: "Brooklyn, NY")
      movie1 = studio1.movies.create!(title: "Gone with the wind", creation_year: 1977, genre: "Country Western")

      visit "/movies/#{movie1.id}" 

      expect(page).to have_content(movie1.title)
      expect(page).to have_content(movie1.creation_year)
      expect(page).to have_content(movie1.genre)
    end 
    it 'displays movies actors from youngest to oldest' do 
      studio1 = Studio.create!(name: "Shotgun Production", location: "Brooklyn, NY")
      movie1 = studio1.movies.create!(title: "Gone with the wind", creation_year: 1977, genre: "Country Western")
      karan = Actor.create!(name: 'Karan', age: 30)
      john = Actor.create!(name: 'John', age: 22)
      ziggy = Actor.create!(name: 'Ziggy', age: 11)

      ActorMovie.create!(movie_id: movie1.id, actor_id: karan.id)
      ActorMovie.create!(movie_id: movie1.id, actor_id: john.id)
      ActorMovie.create!(movie_id: movie1.id, actor_id: ziggy.id)

      visit "movies/#{movie1.id}"

      expect(page).to have_content((karan.name))
      expect(page).to have_content((john.name))
      expect(john.name).to appear_before(karan.name)
      expect(ziggy.name).to appear_before(john.name)
    end 
  end 
end 