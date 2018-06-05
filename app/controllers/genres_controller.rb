class GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(params[:name])
    redirect_to genres_path
  end
end
