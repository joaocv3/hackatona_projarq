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
  get 'set_student_with_new_appraisal', to: 'roles#set_student_with_new_appraisal'
  get 'set_appraiser', to: 'roles#set_appraiser'
  get 'mark_students_as_presented', to: 'teams#mark_students_as_presented'
  
end