Rails.application.routes.draw do

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  root 'welcome#index'
  
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :create, :update]

  resources :listings do
  resources :reservations 
  end
  # post "/admin/user/:id/listings" => "listing#admin_create", as: admin_listing
  resources :admin, only: [:index, :show]

  get  "/reservations/:id/braintree/new" => "braintree#new", as: "braintree_new"
  post "/reservations/:id/braintree/checkout" => "braintree#checkout", as: "braintree_checkout"

end
