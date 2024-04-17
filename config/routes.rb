Rails.application.routes.draw do
  resources :tasks
  devise_for :users

  devise_scope :user do
    root 'tasks#index'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
