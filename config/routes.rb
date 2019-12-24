Rails.application.routes.draw do
  
  resources :appointments
  # consider substituting the below lines with resources
  #get '/home/appointment/index'
  #get '/home/:id/appointment/new', to: "appointment#new"
  #get 'appointment/edit'

  # devise_for :patients We commented this, because we are going to redefine our routes according to our new controller Patients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  # This is to redefine the default routes and give it the new naming and routing with our new devise controllers 
  devise_for :patients, controllers: { registrations: 'patients/registrations',
    sessions: 'patients/sessions', unlocks: 'patients/unlocks',
    passwords: 'patients/passwords', confirmations: 'patients/confirmations'}


  # resources :patients do
  #     resources :appointments
  # end

  get "/home", to: "home#index", as: "home"


  root to: "home#index"
end
