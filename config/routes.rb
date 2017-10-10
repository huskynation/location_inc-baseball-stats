Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', sessions: 'sessions'}
  get 'pages/home'
  root 'pages#home'
end
