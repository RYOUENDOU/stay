Rails.application.routes.draw do 
  root 'home#top', as: 'home'
  
  devise_for :users
  
  resources :hotels do
	  post 'reservation_calendar/', to: 'reservation_calendar#add_date', as: 'add_date'
	  resources :reservation_calendar, only: [:index,:new, :create, :update, :destroy]
    post 'reservation/', to: 'reservations#preview', as: 'preview'
    resources :reservations
    resources :reviews, only: [:index, :new, :create]
  end
  #admin routes
  scope 'admin' do
    resources :reservations
    resources :reviews, only: [:index, :new, :create, :destroy]
  end 
  
  namespace 'owner' do
  	resources :reservations
  	resources :hotels, only: [:show]
  end 

end
