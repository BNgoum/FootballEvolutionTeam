Rails.application.routes.draw do
	
  resources :equipe_persos do
    member do
      get 'entrainer'
    end
  end

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
    member do
      get 'defier'
    end
  end

  resources :equipes do
    member do
      get 'defier'
    end
    member do
      get 'acheter'
    end
  end
  resources :photos


end
