Rails.application.routes.draw do

  resources :surveys
  resources :documents
  resources :agency_providers
  root to: 'visitors#index'
  resources :events
    resources :resources
    resources :career_plan_outcomes
  resources :education_planners
  resources :work_site_planners
  resources :work_search_blogs
  resources :job_search
  resources :interest_profilers
  resources :questions
  resources :apprenticeships
  resources :trainings
  get 'educations/:id/update_course' => 'educations#update_course', as: 'update_course'
  resources :educations
  resources :addresses
  resources :clients
  # We are customizing the registration route to add our company fields
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :users, :companies
  resources :users_admin, :controller => 'users'

  get "/client/select/:id" => "clients#select_student" , as: :select_student

  resources :master_domain_items
  resources :master_domains

  


end

