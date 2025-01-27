Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :users do
    member do
      get :likes
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recipes do
    resources :likes, only: [:create, :destroy]
  end

  root 'recipes#index'
end
