Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles
  # get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  devise_scope :user do
   get "/auth/:provider/callback", to: "sessions#create_from_omniauth"
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
