Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/register' => 'users#new'
  get '/users' => 'users#index'
  get '/users/:id', to:  'users#show', as: 'user'
#  get '/patients/:id', to: 'patients#show', as: 'patient'

  #get "texts/counter" => "texts#counter"
  root 'texts#index'
  post 'counter' => 'texts#counter', as: :counter
  resources :texts, :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
