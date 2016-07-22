Rails.application.routes.draw do
  resources :emergencies
  resources :responders
  root to: 'responders#index'
end
