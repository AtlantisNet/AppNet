Rails.application.routes.draw do
  resources :paginas do
    resources :bets
  end
  devise_for :users
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
