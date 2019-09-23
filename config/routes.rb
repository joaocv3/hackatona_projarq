Rails.application.routes.draw do
  resources :students
  resources :appraisals
  resources :appraisers
  resources :teams
  resources :courses

  root to: "appraisals#index"
end