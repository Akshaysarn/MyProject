Rails.application.routes.draw do
  root "users#index", page: "index"

  get 'users/welcome'
  get 'users/confirm'
  get 'users/mailalerts'

  get 'users/new'
  get 'users/index'

  get 'users/signin'
  get 'users/aboutus'
  get 'users/contact'
  
  post 'users/auth'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users
  
  
#  get "/users/:page" => "users#show"

  
end
