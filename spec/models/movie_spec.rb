require 'rails_helper'

RSpec.describe Movie do
    before do 
    @studio1 = Studio.create!(name: "Shotgun Production", location: "Brooklyn, NY")
    @movie1 = @studio1.movies.create!(title: "Gone with the wind", creation_year: 1977, genre: "Country Western")
    @karan = Actor.create!(name: 'Karan', age: 30)
    @john = Actor.create!(name: 'John', age: 22)
    @ziggy = Actor.create!(name: 'Ziggy', age: 11)

    ActorMovie.create!(movie_id: @movie1.id, actor_id: @karan.id)
    ActorMovie.create!(movie_id: @movie1.id, actor_id: @john.id)
    ActorMovie.create!(movie_id: @movie1.id, actor_id: @ziggy.id)
  end 

  describe 'relationships' do
    it { should belong_to(:studio) }
    it { should have_many(:actors).through(:actor_movie) }
  end

  describe 'validations' do 
    it { should validate_presence_of :title}
    it { should validate_presence_of :creation_year}
    it { should validate_presence_of :genre}
  end 

  describe 'methods' do 
    it 'has actors in order from youngest to oldest' do 

      expect(@movie1.order_actors).to eq([@ziggy, @john, @karan])
    end 

    it 'has actors average age' do 

      expect(@movie1.average_age).to eq(21)
    end 
  end 
end
