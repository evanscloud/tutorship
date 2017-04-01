Rails.application.routes.draw do
  resources :users
  match '/auth/:provider/callback', to: 'session#create', via: [:get, :post]
  match '/logout', to: 'session#destroy', via: [:get, :post]
end
