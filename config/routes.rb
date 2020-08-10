Rails.application.routes.draw do
  resources :compares
  resources :companies do
 	  collection { post :import }
	end
  
  get 'pc/index'
  devise_for :users
  get 'pages/help'
  get 'pages/contact'
  
  root 'companies#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
