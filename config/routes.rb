Rails.application.routes.draw do

  root to: 'public#index'

  resource :search, only: [:show] do 
    member do
      get :list
    end
  end

  resources :programs

end
