Rails.application.routes.draw do
  devise_for :users
  get 'guitars/show_all', to: 'guitars#show_all', as: 'show_all'
  resources :guitars
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
