Rails.application.routes.draw do
  resources :event_participants
  resources :events
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup',
      event_id: 'event_id'
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
end