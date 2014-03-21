Betastore::Application.routes.draw do
  resources :subscriptions
  root :to => 'subscriptions#new'
end
