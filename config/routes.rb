Betastore::Application.routes.draw do

  get '/sign_up'=> 'customers#new', as: 'sign_up'
  post '/sign_up' => 'customers#create'


  #link and an email, needs to be a get
  get '/verify/:token'=> 'customers#verify', as: 'verify_customer_path'

  namespace :admin do
    get  '/login' => 'logins#new', as: 'logins'
    post '/login' => 'logins#create'

    resources :products
     # get '/products'     => 'products#index', as: 'products'
     # get '/products/new' => 'products#new', as: 'new_product'
     # get '/products/:id' => 'products#show',  as: 'product'
     # post '/products' => 'products#create'
  end
  resources :subscriptions
  root :to => 'subscriptions#new'

  get '/products' => 'products#index'
end
