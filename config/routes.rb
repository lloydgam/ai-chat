Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :messages, only: [:index, :create]
    end
  end
  
end
