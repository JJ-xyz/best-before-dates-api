Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # # -- BEGIN --original
  #
  # resources :users, path: 'api/users'
  # resources :items, path: '/api/items'
  # resources :households, path: '/api/households'
  #
  # # -- END -- Original

  # -- BEGIN --suggested

  resources :users, only: [:create, :show, :update] do
    resources :households, only: [:index, :create, :show, :update, :destroy] do
      resources :items, only: [:index, :create, :show, :update, :destroy] do
      end
    end
  end

  # -- END -- Suggested

end
