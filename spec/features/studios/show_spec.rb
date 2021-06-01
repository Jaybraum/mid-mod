require 'rails_helper'

RSpec.describe 'Studio show page' do
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

  it 'shows the studios attributes' do
    visit "/studios/#{@studio.id}"

    expect(page).to have_content(@studio.name)
    expect(page).to have_content(@studio.location)
  end

  it 'shows the names of all the movies it has' do
    visit "/studios/#{@studio.id}"

    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_2.title)
    expect(page).to have_content(@movie_3.title)
  end

  it 'I see a unique list of actors that have acted in any of the studios movies ordered from oldest actor to youngest
        currenlty working' do
    visit "/studios/#{@studio.id}"

    expect(page.all(".actor")[0].text).to eq(@actor_1.name)
    expect(page.all(".actor")[1].text).to eq(@actor_3.name)
    expect(page.all(".actor")[2].text).to eq(@actor_2.name)
  end
end
