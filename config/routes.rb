Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, path: '/api/users'
  resources :items, path: '/api/items'
  resources :households, path: '/api/households'
end
