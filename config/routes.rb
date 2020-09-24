Rails.application.routes.draw do
  get 'terms/index'
  get 'terms/new'
  root to: 'terms#index'
  resources :terms
end