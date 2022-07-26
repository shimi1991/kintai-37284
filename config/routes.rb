Rails.application.routes.draw do
  devise_for :users
  get 'kintais/index'
  root to: "kintais#index"
  resources :users, only: [:edit, :update]
    resources :kintais, only: [:index, :create]
  
end
