Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :persons
    get '/notifications/adult_notifications', to: 'notifications#adult_notifications'
    resources :notifications
    resources :assets
  end
end
