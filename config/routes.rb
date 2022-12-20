Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'users#index'

  resources :expenses
  resources :labelings
  resources :labels
  resources :logins, only: %i[new create destroy]
  resources :users
end
