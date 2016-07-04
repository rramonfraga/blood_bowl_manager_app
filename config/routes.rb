Rails.application.routes.draw do

  root 'communities#index'

  devise_for :users

  resources :communities, only: [:index, :show, :new, :create] do
    resources :championships, only: [:show, :new, :create] do
      resources :matches, only: [:show] do
        resources :feats, only: [:new, :create, :destroy]
      end
    end
  end

  post '/communities/:community_id/championships/:id/start' => 'championships#start'
  post '/communities/:community_id/championships/:id/join' => 'championships#join'
  post '/communities/:community_id/championships/:championship_id/matches/:id/finished' => 'matches#finished'

  resources :teams, only: [:index, :show, :new, :create] do
    resources :players, only: [:index, :new, :create, :edit, :update, :destroy]
  end


  namespace :api, defaults: {format: 'json'} do
    namespace :templates do
      resources :players, only: [:index, :show]
      resources :teams, only: [:index, :show]
      resources :skills, only: [:index, :show]
    end
  end

end
