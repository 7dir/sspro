Rails.application.routes.draw do
  resources :clients
  get 'home/index'
  get 'home/ping'
  get 'home/add'
  get 'home/remove'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
