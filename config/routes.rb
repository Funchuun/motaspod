Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets do
    resources :supercools
    resources :cools
  end
  resources :users
end
