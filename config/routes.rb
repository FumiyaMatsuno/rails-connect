Rails.application.routes.draw do
  devise_for :users
  root to: 'terms#index'
  resources :terms do
    member do
      get 'genre'
    end
  end
end