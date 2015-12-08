Rails.application.routes.draw do
  
  get '/api/skills' => 'skills#index'
  get '/api/skills/:id' => 'skills#show'

  get '/api/teams' => 'teams#index'
  get '/api/teams/:id' => 'teams#show'

  get '/api/players' => 'players#index'
  get '/api/players/:id' => 'players#show'

end
