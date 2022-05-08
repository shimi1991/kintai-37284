Rails.application.routes.draw do
  get 'kintais/index'
  root to: "kintais#index"
end
