Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/studios/:id', to: 'studios#show'
  get '/movies/:id', to: 'movies#show'
  post '/movies/:movie_id/movie_actors', to: 'movie_actors#create'
end
