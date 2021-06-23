Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resources :bands
  resources :albums, only: [:create, :edit, :show, :update, :destroy]
  
  resource :session, only: [:new, :create, :destroy]

  get '/bands/:band_id/albums/new', to: 'albums#new'
end