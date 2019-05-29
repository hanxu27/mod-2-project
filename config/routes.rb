Rails.application.routes.draw do
  root 'pages#home'
  resources :home
  resources :teams
  resources :coaches do
    resources :evaluations
  end
  resources :tryouts
  resources :players
  delete '/tryouts/:id/cancel', to: 'tryouts#cancel', as: 'cancel_tryout'
  get '/tryouts/:id/cancel', to: redirect('/players/%{id}')
  get '/coaches/:id/view_results', to: 'coaches#view_results', as: 'view_results'
  get '/tryouts/:id/evaluations', to: 'tryouts#evaluations', as: 'tryout_evaluations'
  patch '/teams/:id/remove', to: 'teams#remove', as: 'team_remove'
  delete "/coaches/:id/evaluations", to: 'evaluations#delete_incomplete', as: 'delete_incomplete_coach'
  post '/coaches/:id/evaluations/group', to: 'evaluations#add_group', as: 'add_group_coach'
  post '/coaches/:id/evaluations/unflag', to: 'evaluations#unflag', as: 'unflag_coach'
  delete "/coaches/:id/tryouts", to: 'coaches#delete_tryouts', as: 'delete_tryouts'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
