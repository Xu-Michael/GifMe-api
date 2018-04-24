Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :gifs, only: [ :index, :show, :update, :create, :destroy ]
      resources :users, only: [ :index, :show, :create ] do
        resources :collections, only: [ :index, :create, :destroy ]
      end
    end
  end
  require "sidekiq/web"
  mount Sidekiq::Web => '/sidekiq'
end
