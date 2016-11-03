Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # # -- BEGIN --original
  #
  resources :users, path: 'api/users', only: [:create, :show, :destroy] do
   collection do
     post '/login', to: 'users#login'
    end
  end
  resources :items, path: '/api/items'
  resources :households, path: '/api/households'
  #
  # # -- END -- Original

  # -- BEGIN --suggested

  # resources :households, only: [:index, :create, :show, :update, :destroy] do
  #   resources :items, sonly: [:index, :create, :show, :update, :destroy] do
  #   end
  # end

  # -- END -- Suggested

end
