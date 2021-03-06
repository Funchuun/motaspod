Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets do
    resources :likes
    get :search, on: :collection
  end
  
  resources :users do
    collection do
      get :likes
    end
  end
end
