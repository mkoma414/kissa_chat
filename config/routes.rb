Rails.application.routes.draw do

  devise_for :users
  root 'groups#index'

  resources :groups do
    resources :messages
  end
  resources :users, only: [:edit, :update] do
    collection do
      get :search
    end
  end
end
