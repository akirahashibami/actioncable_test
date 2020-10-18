Rails.application.routes.draw do

  root 'home#top'
  resources :rooms, only: [:show, :create]
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :chats
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
