require 'rails_helper'

RSpec.describe Studio do
  describe 'relationships' do
    it {should have_many :movies}
  end

  describe 'instance methods' do
    before(:each) do
      @studio = Studio.create!(name: 'Pixar', location: 'Emeryville')

      @movie_1 = @studio.movies.create!(title: 'Toy Story', creation_year: 1996 , genre: 'Animated')
      @actor_1 = Actor.create!(name: 'Tom Hanks', age: 64, currently_working: true)
      MovieActor.create!(actor: @actor_1, movie: @movie_1)

      @movie_2 = @studio.movies.create!(title: 'Wall-E', creation_year: 2008 , genre: 'Animated')
      @actor_2 = Actor.create!(name: 'Jeff Garlin', age: 45, currently_working: true)
      MovieActor.create!(actor: @actor_2, movie: @movie_2)

      @movie_3 = @studio.movies.create!(title: 'Cars', creation_year: 2006 , genre: 'Animated')
      @actor_3 = Actor.create!(name: 'Owen Wilson', age: 52, currently_working: true)
      MovieActor.create!(actor: @actor_3, movie: @movie_3)
    end

    describe '#actor_by_age_still_working' do
      it 'shows actors still working listed by oldest to youngest' do

        expect(@studio.actor_by_age_still_working).to eq([@actor_1, @actor_3, @actor_2])
      end
    end
  end
end
