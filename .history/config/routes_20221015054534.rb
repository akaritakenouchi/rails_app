Rails.application.routes.draw do
  devise_for :users
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tweets
  root 'tweets#index'
end
