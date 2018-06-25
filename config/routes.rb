Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',registrations: "users/registrations" }

  get 'articles/search', to: 'articles#search'
  root 'articles#index'
  resources :articles do
  	resource :votes, only: [:upvote, :downvote] do
  		member do
  			get 'upvote'
        get 'downvote'
  		end
  	end
  end

  resources :devices, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
