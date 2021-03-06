Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

  root to: 'frontend#index'
end
