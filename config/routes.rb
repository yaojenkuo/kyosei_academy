Rails.application.routes.draw do
  resources :courses
  resources :teachers
  resources :tracks
  resources :about, only: [:index]
  root "about#index"
end
