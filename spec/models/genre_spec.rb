require 'rails_helper'

describe Genre, type: :model do
  describe "instance method " do
    it 'can calculate average rating for all movies' do
      genre = Genre.create(name: 'scifi')
      director = Director.create(name: 'manoj')
      movie = genre.movies.create(title: 'move', description: 'this is move', director: director, rating: 4)
      movie1 = genre.movies.create(title: 'move1', description: 'this is move1', director: director, rating: 3)
      movie2 = genre.movies.create(title: 'move2', description: 'this is move2', director: director, rating: 1)

      average_rating = (movie.rating + movie1.rating + movie2.rating) / 3

      expect(genre.average_rating_for_all_movies).to eq(average_rating)
    end
    describe "relationships" do
      it {should have_many(:movies).through(:genre_movies)}
    end
  end
end
