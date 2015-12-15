Rails.application.routes.draw do

  root 'societies#index'

  devise_for :users

  resources :societies, only: [:index, :show, :new, :create] do
    resources :championships, only: [:show, :new, :create] do
      resources :matches, only: [:show] do
        resources :feats, only: [:new, :create, :destroy]
      end
    end
  end

  post '/societies/:society_id/championships/:id/start' => 'championships#start'
  post '/societies/:society_id/championships/:id/join' => 'championships#join'

  post '/societies/:society_id/championships/:championship_id/matches/:id/finished' => 'matches#finished'

  resources :user_teams, only: [:index, :show, :new, :create,:update, :destroy] do
    resources :user_players, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  get '/api/skills' => 'skills#index'
  get '/api/skills/:id' => 'skills#show'
  get '/api/skills/categories/:category' => 'skills#show_by_category'

  get '/api/teams' => 'teams#index'
  get '/api/teams/:id' => 'teams#show'
  get '/api/teams/:id/players' => 'teams#show_players'

  get '/api/players' => 'players#index'
  get '/api/players/:id' => 'players#show'

end
