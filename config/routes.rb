Rails.application.routes.draw do
  resources :teams
  resources :admins
  resources :coaches do
    resources :evaluations
  end
  resources :tryouts, except: [:index]
  resources :players
  delete '/tryouts/:id/cancel', to: 'tryouts#cancel', as: 'cancel_tryout'
  get '/tryouts/:id/cancel', to: redirect('/players/%{id}')
  get '/admins/:id/view_results', to: 'admins#view_results', as: 'view_results'
  get '/tryouts/:id/evaluations', to: 'tryouts#evaluations', as: 'tryout_evaluations'
  patch '/teams/:id/remove', to: 'teams#remove', as: 'team_remove'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
