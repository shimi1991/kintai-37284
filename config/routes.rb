Rails.application.routes.draw do
  devise_for :users
  get 'kintais/index'
  root to: "kintais#index"
  resource :users, only: [:edit, :update]
end
