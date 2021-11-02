class ActorMoviesController < ApplicationController
  def create 
    movie = Movie.find(params[:id])
    actor = Actor.find_by(name: params[:new_actor])
    ActorMovie.create!(movie: movie, actor: actor)
    redirect_to "/movies/#{movie.id}"
  end
end 