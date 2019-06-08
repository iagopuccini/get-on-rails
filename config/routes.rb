Rails.application.routes.draw do
  root 'home#show'

  devise_for :users

  resources :artists do
    resources :releases
  end
end
