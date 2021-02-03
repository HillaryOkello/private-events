Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :show, :create]
  resources :sessions, only:[:new, :create, :destroy]
  resources :events, except: [:destroy, :edit]

  
  root 'users#new'
end
