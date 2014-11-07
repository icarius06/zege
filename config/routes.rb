Rails.application.routes.draw do
  root to: 'welcome#index'
  
  devise_for :users
  
  resources :users do
  	resources :permissions
  end
  resources :security_levels do
  	resources :pages
  	resources :permissions
  end

  resources :permissions
  resources :pages

end
