Gritter::Application.routes.draw do
  resources :grits
  resources :sessions, only: [:new, :create, :destroy]
  resources :registrations, only: [:new, :create]
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      post 'follow', as: 'follow'
      delete 'unfollow', as: 'unfollow'
    end
    collection do
      get 'recommended', as: 'recommended'
    end
  end

  get 'sign_in', to: 'sessions#new', as: 'sign_in'
  get 'sign_out', to: 'sessions#destroy', as: 'sign_out'

  root to: 'grits#index'

end
