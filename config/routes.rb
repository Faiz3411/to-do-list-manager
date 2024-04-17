Rails.application.routes.draw do
  resources :tasks
  devise_for :users

  devise_scope :user do
    root 'tasks#index'
  end

  match "*path", to: "application#render_404", via: :all
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
