Rails.application.routes.draw do
  #get "texts/counter" => "texts#counter"
  post 'counter' => 'texts#counter', as: :counter
  resources :texts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
