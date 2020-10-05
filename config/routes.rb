Rails.application.routes.draw do
  devise_for :users
  root to: 'terms#index'
  resources :terms do
    member do
      get 'genre'
      get 'search'
    end
    collection do
      get 'research'
    end
  end
end