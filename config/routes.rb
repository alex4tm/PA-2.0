Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get dashboard from the profile controller with method dashboard
  get "/dashboard", to: 'profile#dashboard'
  get "/my_bookings", to: 'profile#my_bookings'

  resources :categories, except: [:show] do
    resources :preferences, except: [:show]
  end
  resources :restaurants, only: [:show] do
    resources :bookings, only: [:new, :create, :index] do
      collection do
        get :available
      end
    end
  end

  patch '/reset_uid', to: 'categories#reset_uid'
end
