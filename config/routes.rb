Rails.application.routes.draw do

  root to: 'public#index'

  resource :search, only: [:show]
  resources :programs

end
