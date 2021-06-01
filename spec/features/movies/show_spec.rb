require 'rails_helper'

RSpec.describe 'Movies show page' do
  before(:each) do
    @studio = Studio.create!(name: 'Pixar', location: 'Emeryville')
    @movie = @studio.movies.create!(title: 'Toy Story', creation_year: 1996 , genre: 'Animated')
    @actor_1 = Actor.create!(name: 'Tom Hanks', age: 64, currently_working: true)
    @actor_2 = Actor.create!(name: 'Tim Allen', age: 67, currently_working: true)
    MovieActor.create!(actor: @actor_1, movie: @movie)
    MovieActor.create!(actor: @actor_2, movie: @movie)
  end

  it 'shows the movies attributes' do
    visit "/movies/#{@movie.id}"

    expect(page).to have_content(@movie.title)
    expect(page).to have_content(@movie.creation_year)
    expect(page).to have_content(@movie.genre)
  end

  it 'shows the movies actors' do
    visit "/movies/#{@movie.id}"

    expect(page).to have_content(@actor_1.name)
    expect(page).to have_content(@actor_2.name)
  end

  it 'has form to add actor to movie' do
    visit "/movies/#{@movie.id}"

    fill_in 'Name', with: 'Andy'
    fill_in 'age', with: '10'
    fill_in 'Working?', with: 'Yes'

    click_on 'Create Actor'

    expect(current_path).to eq("/movies/#{@movie.id}")
    expect(page).to have_content('Andy')
  end
end
