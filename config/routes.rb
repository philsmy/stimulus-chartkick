Rails.application.routes.draw do
  resources :customers
  resources :purchases do
    get 'purchases_data', on: :collection
  end
  get 'charttest/index'

  root 'purchases#index'
end
