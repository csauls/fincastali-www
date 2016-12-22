Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  constraints subdomain: 'admin' do
    scope module: 'admin', as: 'admin' do
      root to: 'dashboard#show'
    end
  end

  root to: 'pages#home'
end
