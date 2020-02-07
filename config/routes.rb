Rails.application.routes.draw do
  namespace :client do
    get '/products' => 'products#index'
    get '/products/new' => 'products#new'
    post '/products' => 'products#create'
    get '/products/:id' => 'products#show'
  end
end
