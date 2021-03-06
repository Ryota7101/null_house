Rails.application.routes.draw do
  get 'houses/index'

  get 'houses/show'

  get 'houses/edit'

  get 'houses/new'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'
  
  get 'admins/users'
  get 'admins/houses'
  get 'admins/comments'
  get 'admins/reservations'
  get 'admins/datavisualizations'

  root 'static_pages#home' # => root_path
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users do
    member do
      # /users/:id/ ...
      get :following, :followers
      # GET /users/1/following => following action
      # GET /users/1/followers => followers action
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :relationships,       only: [:create, :destroy]
  resources :houses, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create]
    resources :reservations,only: [:create]
  end
  
  resources :favorites, only: [:create, :destroy]
  
  scope '/admins' do
    resources :notices, only: [:index, :show, :new, :create, :destroy]
  end
  
  resources :offers, only: [:new, :create]

end
