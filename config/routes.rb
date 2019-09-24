Rails.application.routes.draw do
  resources :students do
    get 'suggest_team', to: 'students#suggest_team'
    post 'suggest_team', to: 'students#suggest_team'
  end


  resources :appraisals
  resources :appraisers
  resources :teams
  resources :courses

  root to: "appraisals#index"
end