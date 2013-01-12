TwBootstrap::Application.routes.draw do
  root :to => "posts#index"

  resources :posts, only: [:new, :create, :show] do
  	resources :comments, only: [:new, :create]
  	resources :votes, only: [:create]
  end

  resources :users, only: [:create, :new]
  get :register, to: "users#new", as: "register"

  get :login, to: "sessions#new", as: "login"
  post :login, to: "sessions#create"
  get :logout, to: "sessions#destroy", as: "logout"
  
  match "/search", to: "search#index"

end
