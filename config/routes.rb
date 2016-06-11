Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'devise_users/sessions',
    passwords: 'devise_users/passwords',
    registrations: 'devise_users/registrations'
  }
  resources :users

  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

  root to: 'frontend#index'
end
