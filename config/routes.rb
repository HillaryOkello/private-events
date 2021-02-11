Rails.application.routes.draw do
  resources 'registrations'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :show, :create]
  resources :sessions, only:[:new, :create, :destroy]
  resources :events
  resources :event_enrolment, only: [ :create, :destroy, :update ]
  scope :sessions do
    get 'signup', to: 'users#new'
    get 'login', to: 'sessions#new', as: 'login'
    get 'signout', to: 'sessions#destroy'
  end

  
  root 'events#index'
end
