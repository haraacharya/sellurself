TwBootstrap::Application.routes.draw do
  root :to => "posts#index"

  resources :posts, only: [:new, :create, :show] do
  	resources :comments, only: [:new, :create]
  	resources :votes, only: [:create]
  end

  resources :categories, only: [:create, :new]
  get :categories, to: "categories#index", as: "/categories"
  
  resources :users, only: [:create, :new, :show, :edit, :update]
  #get :profile, to: "users#show", as: "/profile"
  get :register, to: "users#new", as: "register"

  get :login, to: "sessions#new", as: "login"
  post :login, to: "sessions#create"
  get :logout, to: "sessions#destroy", as: "logout"
  
  match "/search", to: "search#index"

end
