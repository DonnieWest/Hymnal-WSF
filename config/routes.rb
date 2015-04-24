Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  root to: 'songs#index'

  resources :songs

  resources :writer

end
