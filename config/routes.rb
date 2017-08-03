Rails.application.routes.draw do
  root 'questions#index'

  get 'sessions/new' => 'sessions#new', as: :login
  post 'sessions/new' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy', as: :logout

  get 'register' => 'users#new', as: :registration
  post 'register' => 'users#create'

  get 'users/:username' => 'users#show', as: :user

  resources :questions do
    resources :answers
  end

  namespace :api do
    resources :questions do
      resources :answers
    end
  end
end
