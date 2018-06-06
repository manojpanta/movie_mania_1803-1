require 'rails_helper'

describe " visitor visits genre index index page" do
  context "as visitor" do
    it "allows visitor  to see all genre names " do
      genre = Genre.create(name: 'scifi')
      genre1 = Genre.create(name: 'genre')


      visit genres_path

      expect(page).to have_content(genre.name)
      expect(page).to have_content(genre1.name)
    end

    it "allows visitor to click on genre name to go to show page " do
      director = Director.create(name: 'manoj')
      genre = Genre.create(name: 'scifi')
      movie = genre.movies.create(title: 'movie1', description: 'this is move', director: director)

      visit genres_path

      click_on genre.name

      expect(current_path).to eq(genre_path(genre))
    end

    it "i see movies for genre in genre show page" do
      director = Director.create(name: 'manoj')
      genre = Genre.create(name: 'scifi')
      movie = genre.movies.create(title: 'movie1', description: 'this is move', director: director)
      movie1 = genre.movies.create(title: 'movie2', description: 'this is move2', director: director)

      visit genre_path(genre)

      expect(page).to have_content(movie.title)
      expect(page).to have_content(movie1.title)
    end
  end
end
