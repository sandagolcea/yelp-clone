Rails.application.routes.draw do
  devise_for :users
  root to: "restaurants#index"
  get 'restaurants' => 'restaurants#index'

  resources :restaurants do
    resources :reviews
  end
  
end
