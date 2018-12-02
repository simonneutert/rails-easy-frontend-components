Rails.application.routes.draw do
  resources :welcomes

  namespace :api do
    resources :names
  end

  root 'welcomes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
