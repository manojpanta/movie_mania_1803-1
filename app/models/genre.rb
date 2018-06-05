class Genre < ApplicationRecord
  has_many :genre_movies
  has_many :movies, through: :genre_movies

  def average_rating_for_all_movies
    movies.average(:rating).to_i
  end
end
