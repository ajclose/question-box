Rails.application.routes.draw do
  root 'questions#index'

  get 'login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'
  delete 'login' => 'sessions#destroy', as: :logout

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
