Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :users
  resources :links do
  collection do
    match 'search' => 'links#index', :via => [:get, :post], :as => :search
  end
end
  root 'links#index'
end
