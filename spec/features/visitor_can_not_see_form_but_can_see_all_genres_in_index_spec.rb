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
      genre = Genre.create(name: 'scifi')
      genre1 = Genre.create(name: 'genre')

      visit genres_path

      click_on genre.name

      expect(current_path).to eq(genre_path(genre))
    end
  end
end
