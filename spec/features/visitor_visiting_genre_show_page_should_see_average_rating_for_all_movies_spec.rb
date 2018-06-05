require 'rails_helper'

describe "visitor visiting genre show page" do
  context "as visitor" do
    it "should see average rating for all movies" do
      genre = Genre.create(name: 'scifi')
      director = Director.create(name: 'manoj')
      movie = genre.movies.create(title: 'move', description: 'this is move', director: director, rating: 4)
      movie1 = genre.movies.create(title: 'move1', description: 'this is move1', director: director, rating: 3)
      movie2 = genre.movies.create(title: 'move2', description: 'this is move2', director: director, rating: 1)

      average_rating = (movie.rating + movie1.rating + movie2.rating) / 3

      visit genre_path(genre)
      expect(page).to have_content("Average Rating For All Movies: #{average_rating}")

    end
  end
end
