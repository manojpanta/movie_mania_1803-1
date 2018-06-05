require 'rails_helper'

describe " visitor visits movie show page" do
  context "as visitor" do
    it "allows visitor  to see all genres for the movie " do
      genre = Genre.create!(name: 'scifi')
      director = Director.create!(name: 'manoj')
      movie = genre.movies.create(title: 'move', description: 'this is move', director: director)
      genre1 = movie.genres.create!(name: 'this is new genre')


      visit movie_path(movie.slug)

      expect(page).to have_content('Genres For This Movie:')
      expect(page).to have_content(genre.name)
      expect(page).to have_content(genre1.name)
    end
    it "shows rating for this movie" do
      director = Director.create!(name: 'manoj')
      genre = Genre.create!(name: 'scifi')
      movie = genre.movies.create(title: 'move', description: 'this is move', director: director, rating: 5)


      visit movie_path(movie.slug)

      expect(page).to have_content("Rating: 5")
    end
  end
end
