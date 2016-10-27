Rails.application.routes.draw do
  resources :sites, only: [:index, :create]
end
