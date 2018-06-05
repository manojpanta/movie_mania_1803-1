class GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(params[:name])
    redirect_to genres_path
  end

  def show
    @genre = Genre.find(params[:id])
    @movies = @genre.movies
    @average = @genre.average_rating_for_all_movies
  end
end
