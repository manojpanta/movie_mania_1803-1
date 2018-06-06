class GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
    @movies = @genre.movies
    @average = @genre.average_rating_for_all_movies
    @high_movie = @genre.movie_with_highest_rating
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
