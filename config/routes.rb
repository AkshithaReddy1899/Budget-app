Rails.application.routes.draw do
  devise_for :users
  
  authenticated :user do
    root to: 'users#index', as: :authenticated_root
  end
  root "users#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
