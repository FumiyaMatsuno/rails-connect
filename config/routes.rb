Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
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