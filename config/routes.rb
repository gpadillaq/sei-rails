Rails.application.routes.draw do
  namespace :admin do
    resources :users
    root to: "home#index"
    resources :answer_types
    resources :answers
    resources :question_types
    resources :questions
    resources :survey_comments
    resources :survey_results
    resources :subjects
    resources :surveys
    resources :intervals
    resources :groups
    resources :levels
    resources :user_types
    resources :user_surveys
    devise_for :users, path: 'admin'
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
