# frozen_string_literal: true

Rails.application.routes.draw do
  get 'export', to: 'exports#export_data', as: :export_data

  resources :authors
  resources :artists
  resources :lps
  resources :lps do
    resources :songs do
      member do
        # put 'set_authors', to: 'songs#set_authors'
        put 'set_authors'
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'home#index'
end
