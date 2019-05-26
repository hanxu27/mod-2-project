Rails.application.routes.draw do
  resources :teams
  resources :deciders
  resources :coaches
  resources :evaluations
  resources :tryouts
  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
