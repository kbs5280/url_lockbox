Rails.application.routes.draw do
  root 'links#index'

  get '/dashboard', to: 'dashboard#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources 'users', only: [:new, :create]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :urls, only: [:index, :create, :update, :edit, :destroy]
      resources :read_urls, only: [:index]
      resources :unread_urls, only: [:index]
      resources :sort_alphabetically, only: [:index]
    end
  end
end
