Rails.application.routes.draw do
  resources :answer_types
  resources :answers
  resources :question_types
  resources :questions
  resources :subject_comments
  resources :subject_results
  resources :subjects
  resources :surveys
  resources :intervals
  resources :groups
  resources :levels
  resources :user_types
  resources :user_surveys
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
