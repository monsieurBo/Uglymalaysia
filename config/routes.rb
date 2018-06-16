Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'articles#index'
  resources :articles
  # get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  devise_scope :user do
   get "/auth/:provider/callback", to: "sessions#create_from_omniauth"
   get 'auth/facebook/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
