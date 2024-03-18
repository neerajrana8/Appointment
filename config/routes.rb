Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
   root "coaches#index"
  resources :coaches
  resources :appointments, only: [:show]
  get '/book_appointments/:slot_id', to: 'appointments#book', as: 'book_appointments'
end
