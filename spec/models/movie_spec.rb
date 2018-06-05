require 'rails_helper'

describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to(:director)}
    it {should have_many(:actors).through(:actor_movies)}
  end

  describe 'instance methods' do
    it 'should generate a slug for a new movie' do
      director = Director.create(name: 'foo')
      movie = director.movies.create(title: 'Jurassic Park', description: 'blah')

      expect(movie.slug).to eq(movie.title.parameterize)
    end
  end
  it 'should not be valid if rating is greater than 5' do
    director = Director.create(name: 'foo')
    movie = director.movies.create(title: 'Jurassic Park', description: 'blah', rating: 6)

    expect(movie).to be_invalid
  end

  it 'should not be valid if rating is less than 0' do
    director = Director.create(name: 'foo')
    movie = director.movies.create(title: 'Jurassic Park', description: 'blah', rating: -1)

    expect(movie).to be_invalid
  end
  it 'should  be valid if rating is between 0 and 5' do
    director = Director.create(name: 'foo')
    movie = director.movies.create(title: 'Jurassic Park', description: 'blah', rating: 1)

    expect(movie).to be_valid
  end
end
