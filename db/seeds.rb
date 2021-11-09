universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
ark = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
shrek = universal.movies.create!(title: 'Shrek', creation_year: 2000, genre: 'Comedy')

studio1 = Studio.create!(name: "Shotgun Production", location: "Brooklyn, NY")
movie1 = studio1.movies.create!(title: "Gone with the wind", creation_year: 1977, genre: "Country Western")
karan = Actor.create!(name: 'Karan', age: 30)
john = Actor.create!(name: 'John', age: 22)
ziggy = Actor.create!(name: 'Ziggy', age: 11)
shahrukh = Actor.create!(name: 'Shahrukh Khan', age:55)

ActorMovie.create!(movie_id: movie1.id, actor_id: karan.id)
ActorMovie.create!(movie_id: movie1.id, actor_id: john.id)
ActorMovie.create!(movie_id: movie1.id, actor_id: ziggy.id)
