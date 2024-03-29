Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tweets
  resources :users, only: [:show]
  root 'tweets#index'
  get 'hello/index' => 'hello#index'
  get 'geeksalon' => 'tweets#geek'
end
