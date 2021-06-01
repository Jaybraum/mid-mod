require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many(:movie_actors)}
    it {should have_many(:actors).through(:movie_actors)}
  end

  describe 'instance methods' do
    before(:each) do
      @studio = Studio.create!(name: 'Pixar', location: 'Emeryville')
      @movie = @studio.movies.create!(title: 'Toy Story', creation_year: 1996 , genre: 'Animated')
      @actor_1 = Actor.create!(name: 'Tom Hanks', age: 64, currently_working: true)
      @actor_2 = Actor.create!(name: 'Tim Allen', age: 67, currently_working: true)
      MovieActor.create!(actor: @actor_1, movie: @movie)
      MovieActor.create!(actor: @actor_2, movie: @movie)
    end

    describe '#actors' do
      it 'shows actors by name' do

        expect(@movie.actors).to eq([@actor_1, @actor_2])
      end
    end
  end
end
