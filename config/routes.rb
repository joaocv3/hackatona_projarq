Rails.application.routes.draw do
  resources :students do
    get 'suggest_team', to: 'students#suggest_team'
    post 'suggest_team', to: 'students#suggest_team'
  end


  resources :appraisals
  resources :appraisers
  resources :teams
  resources :courses

  root to: "roles#index"
  get 'set_student', to: 'roles#set_student'
  get 'set_appraiser', to: 'roles#set_appraiser'
  
end