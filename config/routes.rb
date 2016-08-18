Rails.application.routes.draw do

  root 'welcome#index'
  get '/welcome', to: 'welcome#welcome'

  devise_for :users, controllers: { confirmations: 'confirmations' }

  resources :communities, only: [:new, :create]

  scope ':community_id' do
    get '/' => 'communities#show'

    resources :championships, only: [:show, :new, :create] do
      resources :matches, only: [:show] do
        resources :feats, only: [:new, :create, :destroy]
      end
    end

    post 'championships/:id/start' => 'championships#start'
    post 'championships/:id/join' => 'championships#join'
    post 'championships/:championship_id/matches/:id/finish' => 'matches#finish'

    resources :teams, only: [:index, :show, :new, :create] do
      resources :players, only: [:new, :create, :destroy]
    end
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :templates do
      resources :players, only: [:index, :show]
      resources :teams, only: [:index, :show]
      resources :skills, only: [:index, :show]
    end
  end
end