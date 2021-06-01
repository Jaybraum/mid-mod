require 'rails_helper'

RSpec.describe 'Studio show page' do
  before(:each) do
    @studio = Studio.create!(name: 'Pixar', location: 'Emeryville')
    @movie_1 = @studio.movies.create!(title: 'Toy Story', creation_year: 1996 , genre: 'Animated')
    @movie_2 = @studio.movies.create!(title: 'Wall-E', creation_year: 2008 , genre: 'Animated')
    @movie_3 = @studio.movies.create!(title: 'Cars', creation_year: 2006 , genre: 'Animated')
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
end
