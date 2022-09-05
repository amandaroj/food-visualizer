Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard"
  get "/profile", to: "pages#profile"
  get "/profile/edit", to: "pages#profile_edit"
  patch "/profile/update", to: "pages#profile_update"
  get "/scanned", to: "pages#scanned"
  get "menus/:menu_id/dishes", to: "pages#dishes", as: "dishes"
  get "reviews", to: "pages#reviews_owner"
  get "preview_scanned", to: "pages#preview_scanned"
  get "menus/:menu_id/preview_dishes", to: "pages#preview_dishes", as: "preview_dishes"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :menus do
      resources :dishes do
        resources :reviews
      end
    end
  end

  get "qr", to: "menus#qr"

  # controller :menus do
  #   get "restaurant_id/menu_id/qr_code_generator", to: "menus#qr_code_generator"
  #   get "restaurant_id/menu_id/qr_code_download", to: "menus#qr_code_download"
  # end
end
