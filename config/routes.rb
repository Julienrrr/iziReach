Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :companies, only: [:show, :new, :create, :update, :edit] do
    resources :campaigns, only: [:new, :create]
  end

  resources :campaigns, only: [:show, :edit, :update, :destroy, :index] do
    resources :influencers, only: [:index]
  end

  resources :influencers, only: [:new, :create, :update, :edit, :show] do
      resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:edit, :update, :destroy] do
    resources :reviews, only: [:new, :create]
  end

  get "/solicitations", to: "solicitations#solicitations"
end

