Rails.application.routes.draw do
    get 'home'                        => 'static#home'
    get 'heathenry(/:category/:name)' => 'static#heathenry'   , as: :heathenry

    get 'lists'         => 'lists#index'    , as: :lists
    get 'lists/:tag'    => 'lists#show'     , as: :list
    get 'news'          => 'news#index'     , as: :news

    namespace :admin do
        get     'session'   => 'sessions#new'       , as: :login
        post    'session'   => 'sessions#create'    , as: :process_login
        delete  'session'   => 'sessions#destroy'   , as: :logout

        resources :lists do
            resources :list_categories, only: [:new, :create], path: 'categories', as: :categories
        end

        resources :list_categories, only: [:show, :edit, :update, :destroy] do
            resources :listings, only: [:new, :create, :edit, :update, :destroy]
        end

        resources :list_entities do
            resources :listings, only: [:new, :create, :edit, :update, :destroy]
        end

        root 'sessions#index'
    end

    root 'static#home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
