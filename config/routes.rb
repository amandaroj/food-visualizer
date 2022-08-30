Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :menus do
      resources :dishes
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
