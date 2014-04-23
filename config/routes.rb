Betastore::Application.routes.draw do

  root 'products#index'
  get '/sign_up'=> 'customers#new', as: 'sign_up'
  post '/sign_up' => 'customers#create'


  #link and an email, needs to be a get
  get '/verify/:token'=> 'customers#verify', as: 'verify_customer'

  namespace :admin do
    get  '/login' => 'logins#new', as: 'logins'
    post '/login' => 'logins#create'

    resources :products
     # get '/products'     => 'products#index', as: 'products'
     # get '/products/new' => 'products#new', as: 'new_product'
     # get '/products/:id' => 'products#show',  as: 'product'
     # post '/products' => 'products#create'
  end

#2. Add a link to that page to log in or sign up

#3. Implement log in for customer that works similar how the user login works for admin

#4. When logged in on the products page, show a message that says "Welcome, customer name" and has a log out link, and then not logged in, has the log in and sign up links.


    get  '/login' => 'logins#new', as: 'logins'
    post '/login' => 'logins#create'
    delete '/logout'=> 'logins#destroy', as: 'logout'

  resources :subscriptions
  # root :to => 'subscriptions#new'

  get '/products' => 'products#index'
end
