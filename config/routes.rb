Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :instruments do
    resources :bookings, only: [:create]
  end
  resources :bookings, except: [:create] do
    collection do
      get 'dashboard', to: "bookings#dashboard"  # BookingsController#dashboard
    end
    member do
      get 'changerating', to: "bookings#changerating"
    end
  end
end
