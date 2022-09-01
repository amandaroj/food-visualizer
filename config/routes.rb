Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard"
  get "/scanned", to: "pages#scanned"
  get "menus/:menu_id/dishes", to: "pages#dishes", as: "dishes"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :menus do
      resources :dishes
    end
  end

  get "qr", to: "menus#qr"

  # controller :menus do
  #   get "restaurant_id/menu_id/qr_code_generator", to: "menus#qr_code_generator"
  #   get "restaurant_id/menu_id/qr_code_download", to: "menus#qr_code_download"
  # end
end
