Rails.application.routes.draw do
  get 'splash/index'
  devise_for :users
  authenticated :user do
    root to: 'groups#index', as: :authenticated_root
  end
  
  root "splash#index"

  resources :users, only: [:index]

  resources :groups, only: [:index, :show, :new, :create] do
    resources :entities, only: [:index, :new, :create, :show]
  end
end
