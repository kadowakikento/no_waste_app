Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :shopping_lists do
    resources :comments
  end
  resources :foods do
    collection do
      get 'search'
    end
  end
  devise_for :users
  root 'articles#index' 
  resources :articles
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
