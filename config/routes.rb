Onapp::Application.routes.draw do

  devise_for :users
  resources :tickets
  resources :customer_tickets
  authenticated :user do
    root to: "tickets#index", as: "authenticated_user"
  end
  root 'customer_tickets#new'
end
