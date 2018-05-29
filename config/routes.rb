Rails.application.routes.draw do
  resources :ldap_managers do
  collection do
    post "import_all"
    get "matching"
  end
end

  resources :users, only: [:index, :update]
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :index
  root to: "index#index"
  resources :putdata, only: [:update]
end
