Rails.application.routes.draw do
  # get 'users/show'
  resources :shopping_lists
  resources :foods
  devise_for :users
  root 'articles#index' 
  resources :articles
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
