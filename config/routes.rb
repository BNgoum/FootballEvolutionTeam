Rails.application.routes.draw do
	
  resources :equipe_persos
  devise_for :users
  devise_for :models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  # get '/bonjour/(:name)', to: 'pages#salut', as: 'salut'
  
  resources :joueurs do
    member do
      get 'vendre'
    end
    member do
      get 'acheter'
    end
  end
  resources :equipes
  resources :photos


end
