Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :posts
  root 'posts#index'
  get 'worker', to: 'posts#worker'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
