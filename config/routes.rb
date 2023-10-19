Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :merchants do
        resources :items, only: [:index], controller: 'merchants/items'

        collection do
          get 'find', to: 'merchants#find'
        end
      end
      
      resources :items do
        collection do
          get 'find_all', to: 'items#find_all'
        end
        get 'merchant', to: 'items/merchants#show'
      end
    end
  end
  
end
