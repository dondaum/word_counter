Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/register' => 'users#new'

  #get "texts/counter" => "texts#counter"
  root 'texts#index'
  post 'counter' => 'texts#counter', as: :counter
  resources :texts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
