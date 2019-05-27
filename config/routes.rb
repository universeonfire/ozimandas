Rails.application.routes.draw do
  resources :navigations
  resources :bookings
  
  resources :currencies
  resources :units
  resources :items
  
  namespace :admin do
      resources :users
      resources :customers
      resources :transporters

      root to: "users#index"
    end
  resources :proposal_headers 
  
  resources :order_headers
  
  
  resources :transporters
  resources :customers
  devise_for :users , path: '', path_names:{sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
 
	authenticate :user do
	   root to: 'pages#home', as: :authenticated_root
	end
	root to: redirect('/login')
  get 'proposals', to: 'proposal_headers#index', as: 'proposals_path'
  get 'proposal/new', to: 'proposal_headers#new' 
  get 'orders', to: 'order_headers#index', as: 'orders_path'
end
