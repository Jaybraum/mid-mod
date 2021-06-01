class MovieActorsController < ApplicationController

  def create
    actor = Actor.find(params[:actor_id])
    movie = Movie.find(params[:movie_id])
    MovieActor.create(actor: actor, movie: movie)

    redirect_to "/movies/#{@movie.id}"
  end
end
