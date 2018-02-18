Rails.application.routes.draw do 
  root 'home#top', as: 'home'
  devise_for :users
  resources :hotels do
	post 'reservation_calendar/', to: 'reservation_calendar#add_date', as: 'add_date'
	resources :reservation_calendar
    get 'reservation/', to: 'reservations#preview', as: 'preview'
    resources :reservations
  end
  	resources :reviews, only: [:index, :new, :create, :destroy]
end
