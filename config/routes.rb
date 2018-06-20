Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',registrations: "users/registrations" }

  root 'articles#index'
  resources :articles do
  	resource :votes, only: [:vote] do
  		member do
  			get 'vote'
  		end
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
