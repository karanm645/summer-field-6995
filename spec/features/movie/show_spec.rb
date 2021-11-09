require 'rails_helper'
RSpec.describe 'user sees one movie' do 
  before do 
    @studio1 = Studio.create!(name: "Shotgun Production", location: "Brooklyn, NY")
    @movie1 = @studio1.movies.create!(title: "Gone with the wind", creation_year: 1977, genre: "Country Western")
    @karan = Actor.create!(name: 'Karan', age: 30)
    @john = Actor.create!(name: 'John', age: 22)
    @ziggy = Actor.create!(name: 'Ziggy', age: 11)
    @shahrukh = Actor.create!(name: 'Shahrukh Khan', age:55)

    ActorMovie.create!(movie_id: @movie1.id, actor_id: @karan.id)
    ActorMovie.create!(movie_id: @movie1.id, actor_id: @john.id)
    ActorMovie.create!(movie_id: @movie1.id, actor_id: @ziggy.id)

    visit "movies/#{@movie1.id}"

  end 
  describe 'they link from the studio index' do 
    it 'displays info for one movie' do 

      expect(page).to have_content(@movie1.title)
      expect(page).to have_content(@movie1.creation_year)
      expect(page).to have_content(@movie1.genre)
    end 
    it 'displays movies actors from youngest to oldest' do 

      expect(page).to have_content((@karan.name))
      expect(page).to have_content((@john.name))
      expect(@john.name).to appear_before(@karan.name)
      expect(@ziggy.name).to appear_before(@john.name)
    end 

    it 'sees the average age of all the movies actors' do 
      expect(page).to have_content("Average Actor Age: #{@movie1.average_age}")
    end 

    it 'has a form to add an actor' do 
      
      expect(page).to_not have_content("Shahrukh Khan")
      
      fill_in 'new_actor', with: "Shahrukh Khan"
      click_button "Submit"

      expect(current_path).to eq("/movies/#{@movie1.id}")
      expect(page).to have_content(@shahrukh.name)
    end 
  end 
end 