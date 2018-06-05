require 'rails_helper'

describe "admin visits genre index index page" do
  context "as admin" do
    it "allows admin to see all genre names " do
      admin = User.create(username: "Dee", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      genre = Genre.create(name: 'scifi')
      genre1 = Genre.create(name: 'genre')

      visit genres_path

      expect(page).to have_content(genre.name)
      expect(page).to have_content(genre1.name)
    end
    it "can see create new genre link and can create new genre " do
      admin = User.create(username: "Dee", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      genre = Genre.create(name: 'scifi')

      visit genres_path

      expect(page).to have_content('Create New Genre')

      fill_in 'genre[name]', with: 'GENRE'
      click_on 'Create Genre'

      expect(current_path).to eq(genres_path)
      expect(page).to have_content(Genre.last.name)
      expect(page).to have_content(genre.name)
    end
  end
end
