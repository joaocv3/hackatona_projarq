Rails.application.routes.draw do
  resources :students
  resources :appraisals
  resources :appraisers
  resources :teams
  resources :courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
