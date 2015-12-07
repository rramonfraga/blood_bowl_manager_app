Rails.application.routes.draw do
  #resources :skills, except: [:new, :edit]
  resources :players, except: [:new, :edit]
  resources :teams, except: [:new, :edit]
  
  get '/api/skills' => 'skills#index'
  get '/api/skills/:id' => 'skills#show'

end
