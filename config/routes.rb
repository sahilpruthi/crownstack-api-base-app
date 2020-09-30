Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :sessions, only: :create
      resources :registrations, only: :create
      resources :products, only: :index do
        collection do
          get :cart_products
          post :add_to_cart
        end
      end
    end
  end
end
