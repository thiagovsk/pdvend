Rails.application.routes.draw do
  resources :legal_people, only: [:index, :create, :new]
  resources :liberal_people, only: [:index, :create, :new]
  resources :people, only: [:index, :create, :new]
  root to: "people#index"
  namespace :teste do
    delete '/remove', to: 'people#index', as: 'ENTROU'
  end
end
